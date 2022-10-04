//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var restaurantStore = RestaurantViewModel()
    @State var isLoginSuccess = false
    @State var restaurantNmae = ""
    
    var body: some View {
        VStack {
            
            if isLoginSuccess {
                searchBar(restaurantName: $restaurantNmae)
                TabView {
                    
                    RestaurantListView(restaurantList: $restaurantStore.restaurantList)
                        .tabItem {
                            Image(systemName: "house")
                        }
                    
                }
            } else {
                LoginView(user: nil, isLoginSuccess: $isLoginSuccess)
            }
            
           
        }
        
    }
}

struct searchBar: View{
    
    @Binding var restaurantName: String
    
    var body: some View {
        HStack {
            TextField("", text: $restaurantName)
            Button(action: {}, label: {
                Image(systemName: "search")
            })
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
