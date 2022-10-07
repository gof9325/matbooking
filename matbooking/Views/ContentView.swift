//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel
    @ObservedObject var restaurantStore = RestaurantViewModel()
    @State var user: User?
    @State var restaurantNmae = ""
    @State var selection = 0
    
    @State var restaurantsList: [Restaurant] = []
    
    var body: some View {
        VStack {
            if self.user != nil {
                searchBar(restaurantName: $restaurantNmae)
                TabView(selection: $selection) {
                    ChatListView()
                        .tabItem {
                            Image(systemName: "message")
                        }
                        .tag(1)
                    RestaurantListView(restaurantList: $restaurantsList)
                        .onAppear{
                            restaurantStore.getRestaurantList()
                        }
                        .onReceive(restaurantStore.$restaurantList, perform: {
                            self.restaurantsList = $0
                        })
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(0)
                    UserDetailView(reservationList: ReservationViewModel())
                        .tabItem {
                            Image(systemName: "person")
                        }
                        .tag(2)
                }
            } else {
                LoginView()
            }
        }.onReceive(userVM.$user, perform: { self.user = $0})
    }
}

struct searchBar: View{
    @Binding var restaurantName: String
    
    var body: some View {
        HStack {
            TextField("", text: $restaurantName)
            Button(action: {
                
            }, label: {
                Image(systemName: "magnifyingglass")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
