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
    
    @State var user: User?
    @State var selection = 0
    
    @State var chatCount = 0
    
    @State var inDetailView = false
    
    var title: String {
        switch selection {
        case 0 :
            return "맛북킹"
        case 1:
            return "채팅목록"
        case 2:
            return "마이페이지"
        default:
            return ""
        }
    }
    
    var body: some View {
        NavigationView {
            if self.user != nil {
                GeometryReader { proxy in
                    TabView(selection: $selection) {
                        ChatListView()
                            .navigationTitle(title)
                            .tabItem {
                                Image(systemName: "message")
                                Text("채팅목록")
                            }
                            .tag(1)
                            .badge(chatCount)
                        RestaurantListView(restaurantVM: restaurantVM,inDetailView: $inDetailView)
                            .navigationTitle(title)
                            .tabItem {
                                Image(systemName: "house")
                                Text("홈")
                            }
                            .tag(0)
                        UserDetailView(rservationVM: ReservationViewModel())
                            .navigationTitle(title)
                            .tabItem {
                                Image(systemName: "person")
                                Text("마이페이지")
                            }
                            .tag(2)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            } else {
                LoginView()
            }
        }.onReceive(userVM.$user, perform: { self.user = $0 })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
