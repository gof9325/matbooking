//
//  RestaurantListVIew.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI
import Introspect

struct RestaurantListView: View {
    @StateObject var restaurantVM: RestaurantViewModel
    @State var restaurantList = [Restaurant]()
    
    @State var restaurantName = ""
    
    @Binding var inDetailView: Bool
    
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    VStack {
                        searchBar(restaurantName: $restaurantName)
                            .padding()
                        if restaurantList.isEmpty {
                            Text("레스토랑 리스트가 없습니다.")
                        } else {
                            List {
                                ForEach(restaurantList, id: \.self) { restaurant in
                                    NavigationLink(destination: RestaurantDetailView(restaurantVM: restaurantVM, restaurant: restaurant, inDetailView: $inDetailView)) {
                                        RestaurantContentView(restaurant: restaurant)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                inDetailView = false
                print("RetaurantListView onAppear: \(inDetailView)")
                restaurantVM.getRestaurantList()
                isLoading = true
            }
        }
        .onReceive(restaurantVM.$restaurantList, perform: {
            self.restaurantList = $0
            isLoading = false
        })
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


struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(restaurantVM: RestaurantViewModel(), inDetailView: .constant(true))
    }
}
