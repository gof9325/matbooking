//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel
    @StateObject var restaurantVM = RestaurantViewModel()
    @StateObject var chatVM = ChatViewModel()
    
    @State var selection = 0
    
    @State var chatCount = 0
    
    @State var inDetailView = false

    var body: some View {
        NavigationView {
            if self.userVM.user != nil {
                GeometryReader { proxy in
                    TabView(selection: $selection) {
                        ChatListView(chatVM: chatVM)
                            .tabItem {
                                Image(systemName: "message")
                                Text("채팅목록")
                            }
                            .tag(1)
                            .badge(chatCount)
                        RestaurantListView(restaurantVM: restaurantVM,restaurantQueryVM: RestaurantQuery(restaurantVM: restaurantVM), chatVM: chatVM, inDetailView: $inDetailView)
                            .tabItem {
                                Image(systemName: "house")
                                Text("홈")
                            }
                            .tag(0)
                        UserDetailView(reservationVM: ReservationViewModel())
                            .tabItem {
                                Image(systemName: "person")
                                Text("마이페이지")
                            }
                            .tag(2)
                    }
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
