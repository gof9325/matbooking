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
    var restaurant: Restaurant
    @State var isPresented = false
    
    @Binding var inDetailView: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                ImageSlider(images: ["house", "person"])
                    .frame(minHeight: 300)
                    .background(.yellow)
                VStack(alignment: .leading) {
                    Text(restaurant.storeInfo.name)
                        .font(.system(size: 50, weight: .heavy))
                        .padding([.top, .bottom], 5)
                    Text(restaurant.storeInfo.description)
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    HStack{
                        Spacer()
                        Image(systemName: "phone")
                        Text(restaurant.storeInfo.phone)
                    }
                    .padding([.top, .bottom], 5)
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
                .matbookingButtonStyle(width: 100)
            }
            .popover(isPresented: $isPresented) {
                MakeReservationsView(restaurantVM: restaurantVM, restaurant: restaurant)
            }
        }
        .onAppear {
            inDetailView = true
        }
        .navigationBarTitle("Title", displayMode: .inline)
           .introspectTabBarController { (UITabBarController) in
               UITabBarController.tabBar.isHidden = true
               uiTabarController = UITabBarController
           }.onDisappear{
               uiTabarController?.tabBar.isHidden = false
           }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurantVM: RestaurantViewModel(), restaurant: Restaurant(id: ""), inDetailView: .constant(true))
    }
}
