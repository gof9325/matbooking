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
                .frame(maxWidth: 120, maxHeight: 120)
                .scaledToFit()
                .background(.green)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("\(restaurant.storeInfo.name)")
//                    Text("테스트")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,  -3)
                    RestaurantReservable(reservable: true)
                }
//                Text("테스트asdfadsfsadfsadfsadfasdfasdf")
                Text("\(restaurant.storeInfo.description)")
            }
            .frame(maxHeight: 130)
            .padding(.leading, 3)
        }
        
//        .scaledToFit()
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

//struct RestaurantItem_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantContentView()
//            .previewLayout(.sizeThatFits)
//            .frame(width: 500)
//    }
//}
