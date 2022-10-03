//
//  RestaurantListVIew.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct RestaurantListView: View {
    @Binding var restaurantList: [Restaurant]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurantList , id: \.self) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant) , label: {
                        RestaurantContentView(restaurant: restaurant)
                    })
                }
            }
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(restaurantList: .constant([Restaurant(name: "aa", isOpen: true, introduction: "asdf")]))
    }
}
