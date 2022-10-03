//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var restaurantStore = RestaurantViewModel()
    
    var body: some View {
        VStack {
            
            TabView {
                
                RestaurantListView(restaurantList: $restaurantStore.restaurantList)
                    .tabItem {
                        Image(systemName: "house")
                    }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
