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
    
    @StateObject var restaurantVM: RestaurantViewModel
    
    @ObservedObject var reservationStore = ReservationViewModel()
    @State var restaurant: Restaurant
    @State var isPresented = false
    
    @Binding var inDetailView: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
//                ImageSlider(images: restaurant.imagesData)
//                ImageSlider(images: ["house", "person"])
//                    .frame(minHeight: 300)
//                    .background(.yellow)
                VStack(alignment: .leading) {
                    Text(restaurant.storeInfo.name)
//                    Text("가게 이름")
                        .font(.system(size: 50, weight: .heavy))
                        .padding([.top, .bottom], 5)
                    Text(restaurant.storeInfo.description)
//                    Text("가게 설명1")
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
                                Text("2 ~ 22 명")
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
            HStack {
                Button("예약하기") {
                    isPresented.toggle()
                }
                .matbookingButtonStyle(width: 100, color: Color.matPeach)
            }
            .popover(isPresented: $isPresented) {
                ReservationsView(restaurantVM: restaurantVM, restaurant: restaurant)
            }
        }
        .onAppear {
            inDetailView = true
        }
        .navigationBarTitle("", displayMode: .inline)
           .introspectTabBarController { (UITabBarController) in
               UITabBarController.tabBar.isHidden = true
               uiTabarController = UITabBarController
           }.onDisappear{
               uiTabarController?.tabBar.isHidden = false
           }
    }
}

//struct RestaurantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantDetailView(restaurantVM: RestaurantViewModel(), restaurant: Restaurant(id: ""), inDetailView: .constant(true))
//    }
//}
