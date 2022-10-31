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
    @StateObject var restaurantVM = RestaurantViewModel()
    
    @State var user: User?
    @State var restaurantNmae = ""
    @State var selection = 0
    
    @State var chatCount = 0
    
    @State var inDetailView = false
    
    var body: some View {
        VStack {
            if self.user != nil {
                if selection == 0 && inDetailView == false {
                    searchBar(restaurantName: $restaurantNmae)
                        .padding()
                }
                NavigationView {
                    TabView(selection: $selection) {
                        ChatListView()
                            .tabItem {
                                Image(systemName: "message")
                            }
                            .tag(1)
                            .badge(chatCount)
                        RestaurantListView(restaurantVM: restaurantVM,inDetailView: $inDetailView )
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
                    .navigationBarHidden(true)
                }
            } else {
                LoginView()
            }
        }.onReceive(userVM.$user, perform: { self.user = $0 })
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
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(18)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
