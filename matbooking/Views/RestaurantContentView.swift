//
//  RestaurantItem.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct RestaurantContentView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
                .background(.green)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("\(restaurant.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 5)
                        .padding(.bottom, -3)
                    RestaurantReservable(reservable: restaurant.isOpen)
                }
                Spacer()
                Text("\(restaurant.introduction)")
            }
            .padding(.leading, 3)
        }
        .frame(height: 150)
        .scaledToFit()
        .padding()
    }
}

struct RestaurantReservable: View {
    let reservable: Bool
    var body: some View {
        Text(reservable ? "예약가능" : "예약불가")
            .padding(5)
            .background(reservable ? .blue : .red)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct RestaurantItem_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantContentView(restaurant: Restaurant(name: "감자탕", isOpen: true, introduction: "호로록", pictures: ""))
            .previewLayout(.sizeThatFits)
            .frame(width: 500)
    }
}
