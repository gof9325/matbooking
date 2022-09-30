//
//  RestaurantListView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import SwiftUI

struct RestaurantListView: View {
    @ObservedObject var restaurantStore = RestaurantViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurantStore.RestaurantList , id: \.self) { restaurant in
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
        RestaurantListView()
    }
}
