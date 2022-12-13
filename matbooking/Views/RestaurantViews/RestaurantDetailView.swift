//
//  RestaurantDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import SwiftUI
import Introspect

struct RestaurantDetailView: View {
    
    @State var uiTabarController: UITabBarController?
    
    @ObservedObject var restaurantVM: RestaurantViewModel
    @ObservedObject var chatVM: ChatViewModel
    
    @StateObject var reservationVM = ReservationViewModel()
    @State var restaurant: Restaurant
    @State var isPresented = false
    @State var imageList = [UIImage]()
    
    @State var reservationResult = false
    
    @Binding var inDetailView: Bool
    
    @State var navigatedToChatDetailView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                ImageSlider(images: imageList)
                    .frame(minHeight: 300)
                    .onAppear {
                        restaurantVM.getImagesTuples(myRestaurant: restaurant)
                    }
//                    .onReceive(restaurantVM.getImageFinished, perform: {
//                        if !$0.isEmpty {
//                            for data in $0 {
//                                imageList.append(UIImage(data: data) ?? UIImage())
//                            }
//                        }
//                    })
                    .onReceive(restaurantVM.getImageTuplesFinished, perform: { tupleList in
                        guard let urlList = restaurant.storeInfo.pictures?.map({$0.url}) else {
                            return
                        }
                        
                        // 딕셔너리 버전
                        if !tupleList.isEmpty {
                            var tupleDict = [String: (Data, String)]()
                            for tuple in tupleList {
                                tupleDict[tuple.1] = tuple
                            }
                            
                            imageList = urlList.map { url in
                                UIImage(data: tupleDict[url]!.0) ?? UIImage()
                            }
                        }
                        
                        // 딕셔너리 버전 - 함수
//                        if !tupleList.isEmpty {
//                            let tupleDict = arrayToDict(arr: tupleList) { tuple in
//                                tuple.1
//                            }
//
//                            imageList = urlList.map { url in
//                                UIImage(data: tupleDict[url]!.0) ?? UIImage()
//                            }
//                        }
//
                        // 배열 각 요소 비교 버전
//                        if !tupleList.isEmpty {
//                            for url in urlList {
//                                if let data = tupleList.first(where: {
//                                    url == $0.1
//                                })?.0 {
//                                    imageList.append(UIImage(data: data) ?? UIImage())
//                                }
//                            }
//                        }
                    })
                VStack(alignment: .leading) {
                    Text(restaurant.storeInfo.name)
                        .font(.system(size: 50, weight: .heavy))
                        .padding([.top, .bottom], 5)
                    Text(restaurant.storeInfo.description)
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    Text("가게 설명2")
                        .font(.body)
                        .padding([.top, .bottom], 5)
                    HStack{
                        Spacer()
                        Image(systemName: "phone")
                        Text(restaurant.storeInfo.phone)
                    }
                    .padding([.top, .bottom], 10)
                    HStack {
                        VStack {
                            Text("예약 가능 인원")
                                .padding(.bottom, 5)
                            HStack {
                                Image(systemName: "person.2")
                                Text("\(restaurant.reservationRestrictions.paxMin) ~ \(restaurant.reservationRestrictions.paxMax) 명")
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("운영 시간")
                                .padding(.bottom, 5)
                            HStack {
                                Image(systemName: "clock")
                                Text("09:00 ~ 22:00")
                            }
                        }
                    }
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .padding()
            }
            VStack {
                if reservationResult {
                    HStack {
                        Text("예약에 성공했습니다.")
                    }
                    .padding()
                    .background(.gray)
                    .opacity(0.7)
                    .cornerRadius(10)
                }
                HStack {
                    NavigationLink("", destination: ChatDetailView(chatVM: chatVM, needsToControlTabbar: false, restuarant: ChatListResponse(message: "", store: Store(id: restaurant.id, storeInfo: restaurant.storeInfo), createdAt: "")), isActive: $navigatedToChatDetailView)
                        .background(.yellow)
                    Spacer()
                    Button("채팅하기") {
                        navigatedToChatDetailView = true
                    }
                    .matbookingButtonStyle(width: 100, color: Color.matPeach)
                    Spacer()
                    Button("예약하기") {
                        isPresented.toggle()
                    }
                    .matbookingButtonStyle(width: 100, color: Color.matPeach)
                    Spacer()
                }
                .padding()
            }
            .popover(isPresented: $isPresented) {
                ReservationsView(reservationVM: reservationVM, restaurantVM: restaurantVM, restaurant: restaurant, reservationResult: $reservationResult)
            }
        }
        .onAppear {
            inDetailView = true
            navigatedToChatDetailView = false
        }
        .navigationBarTitle("", displayMode: .inline)
        .introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden = true
            uiTabarController = UITabBarController
        }.onDisappear{
            if !navigatedToChatDetailView {
                uiTabarController?.tabBar.isHidden = false
            }
        }
    }
}

//struct RestaurantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantDetailView(restaurantVM: RestaurantViewModel(), restaurant: Restaurant(id: ""), inDetailView: .constant(true))
//    }
//}

func arrayToDict<E, KeyType>(arr: [E], getKey: (E) -> KeyType) -> [KeyType:E] where KeyType: Hashable {
    var dict = [KeyType: E]()
    for element in arr {
        dict[getKey(element)] = element
    }
    return dict
}
