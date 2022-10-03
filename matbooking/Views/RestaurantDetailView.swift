//
//  RestaurantDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        VStack {
//            Image(systemName: "")
            Text("\(restaurant.name)")
            Text("\(restaurant.introduction)")
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "aaa", isOpen: true, introduction: "vvvv"))
    }
}
