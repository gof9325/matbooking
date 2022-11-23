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
    
    @Binding var inDetailView: Bool
    
    @State var navigatedToChatDetailView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                ImageSlider(images: imageList)
                    .frame(minHeight: 300)
                    .onAppear {
                        restaurantVM.getImages(myRestaurant: restaurant)
                    }
                    .onReceive(restaurantVM.getImageFinished, perform: {
                        if !$0.isEmpty {
                            for data in $0 {
                                imageList.append(UIImage(data: data) ?? UIImage())
                            }
                        }
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
            HStack(spacing: 30) {
                NavigationLink("", destination: ChatDetailView(chatVM: chatVM, needsToControlTabbar: false, restuarant: ChatListResponse(message: "", store: Store(id: restaurant.id, storeInfo: restaurant.storeInfo), createdAt: "")), isActive: $navigatedToChatDetailView)
                
                Button("채팅하기") {
                    navigatedToChatDetailView = true
                }
                .matbookingButtonStyle(width: 100, color: Color.matPeach)
                
//                NavigationLink(destination: ChatDetailView()) {
//                    Text("채팅하기")
//                }
//                .padding()
//                .frame(width: 100)
//                .background(Color.matPeach)
//                .cornerRadius(10)
//                .foregroundColor(.white)
                
                Button("예약하기") {
                    isPresented.toggle()
                }
                .matbookingButtonStyle(width: 100, color: Color.matPeach)
            }
            .popover(isPresented: $isPresented) {
                ReservationsView(reservationVM: reservationVM, restaurantVM: restaurantVM, restaurant: restaurant)
            }
        }
        .onAppear {
//            print("RestaurantDetailView: OnAppear")
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
