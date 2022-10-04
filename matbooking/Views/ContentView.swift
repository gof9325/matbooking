//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI
import Alamofire

struct ContentView: View {
//    @ObservedObject var user: UserViewModel
    @ObservedObject var restaurantStore = RestaurantViewModel()
    @State var isLoginSuccess = false
    @State var restaurantNmae = ""
    @State var selection = 0
    
    var body: some View {
        VStack {
            
            if isLoginSuccess {
                searchBar(restaurantName: $restaurantNmae)
                TabView(selection: $selection) {
                    ChatView()
                        .tabItem {
                            Image(systemName: "message")
                        }
                        .tag(1)
                    
                    RestaurantListView(restaurantList: $restaurantStore.restaurantList)
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(0)
                    UserDetailView(user: UserViewModel(from: ""), reservationList: ReservationViewModel())
                        .tabItem {
                            Image(systemName: "person")
                        }
                        .tag(2)
                }
            } else {
                LoginView(user: UserViewModel(from: ""), isLoginSuccess: $isLoginSuccess)
            }
            
        }
        
    }
    
//    func callAPIProtected(){
//        let url = "http://172.30.1.81:3000/protected"
//        let headers: HTTPHeaders = ["Authorization" : KeyChain.read(key: "userAccessToken")!]
//        print("usertoken:  \(KeyChain.read(key: "userAccessToken")!)")
//        let request = AF.request(url, headers: headers).responseString { res in
//            res.result.map{ print($0) }
//        }
//    }
    
}

struct searchBar: View{
    @Binding var restaurantName: String
    
    var body: some View {
        HStack {
            TextField("", text: $restaurantName)
            Button(action: {
                
            }, label: {
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
