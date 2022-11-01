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
    
    @Binding var inDetailView: Bool
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurantList , id: \.self) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant, inDetailView: $inDetailView) , label: {
                        RestaurantContentView(restaurant: restaurant)
                    })
                }
                if restaurantList.isEmpty {
                    Text("레스토랑 리스트가 없습니다.")
                }
            }
            .onAppear {
                inDetailView = false
                print("\(inDetailView) inDetailView")
                restaurantVM.getRestaurantList()
            }
            .onReceive(restaurantVM.$restaurantList, perform: {self.restaurantList = $0})
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(restaurantVM: RestaurantViewModel(), inDetailView: .constant(true))
    }
}
