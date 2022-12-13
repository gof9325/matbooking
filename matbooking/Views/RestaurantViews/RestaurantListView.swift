//
//  RestaurantListVIew.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI
import Introspect

struct RestaurantListView: View {
    @ObservedObject var restaurantVM: RestaurantViewModel // 주인은 상위 view
    @StateObject var restaurantQueryVM: RestaurantQuery // 주인은 이 view
    
    @ObservedObject var chatVM: ChatViewModel // 주인은 상위 view
    
    @Binding var inDetailView: Bool
    
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    VStack {
                        searchBar(restaurantQueryVM: restaurantQueryVM)
                            .padding()
                        if restaurantVM.restaurantList.isEmpty {
                            Spacer()
                            Text("레스토랑 리스트가 없습니다.")
                            Spacer()
                        } else {
                            List {
                                ForEach(restaurantVM.restaurantList, id: \.self) { restaurant in
                                    NavigationLink(destination: RestaurantDetailView(restaurantVM: restaurantVM, chatVM: chatVM, restaurant: restaurant, inDetailView: $inDetailView)) {
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
                if (restaurantVM.restaurantList.isEmpty) {
                    isLoading = true
                }
            }
        }
        .onReceive(restaurantVM.$restaurantList, perform: { _ in
            isLoading = false
        })
    }
}

struct searchBar: View {
    @ObservedObject var restaurantQueryVM: RestaurantQuery
    @State var category = Cuisine.all
    
    var body: some View {
        HStack {
            TextField("", text: $restaurantQueryVM.query.name)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(18)
            Text("\(category.emoji)")
                .font(.system(size: 33))
                .contextMenu {
                    ForEach(Cuisine.allCases, id: \.self) { kindOfFood in
                        Button("\(kindOfFood.name)", action: {
                            restaurantQueryVM.query.cuisine = kindOfFood.query
                            category = kindOfFood
                        })
                    }
                }
        }
        .padding()
        
    }
}

//struct RestaurantListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantListView(restaurantVM: RestaurantViewModel(), inDetailView: .constant(true))
//    }
//}
