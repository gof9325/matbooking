//
//  RestaurantListView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import SwiftUI

struct RestaurantListView: View {
    
    var restaurantList = ["감자 순댓국", "감자탕"]
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List {
            ForEach(restaurantList , id: \.self) { restaurant in
                RestaurantContentView()
            }
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
