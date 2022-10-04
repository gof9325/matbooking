//
//  RestaurantDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    @ObservedObject var reservationStore = ReservationViewModel()
    let restaurant: Restaurant
    @State var isPresented = false
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFit()
                    .background(.yellow)
                Text("\(restaurant.name)")
                    .font(.system(size: 50, weight: .heavy))
                    .padding()
                Text("\(restaurant.introduction)")
                    .padding()
                Button("예약하기") {
                    isPresented.toggle()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
            }
            .popover(isPresented: $isPresented) {
                MakeResrvationsView(reservation: $reservationStore.reservationList[0])
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "aaa", isOpen: true, introduction: "vvvv"))
    }
}
