//
//  RestaurantViewModel.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import Foundation
import Alamofire
import Combine

class RestaurantViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    @Published var restaurantList: [Restaurant] = []
    
    init() {
        restaurantList = [
            Restaurant(name: "감자탕", isOpen: true, introduction: "존맛탱이다", pictures: ""),
            Restaurant(name: "떡볶이", isOpen: false, introduction: "맵다매워", pictures: "")
        ]
    }
    
    // MARK: intant functions
    func getRestaurantList() {
        print("RestaurantViewModel - getRestaurantList() called")
        RestaurantsApiService.getRestaurants()
            .sink(receiveCompletion: { completion in
                print("RestaurantViewModel getRestaurantList completion: \(completion)")
            }, receiveValue: { restaurantList in
                print("UserVM fetchUsers fetchedUsers.count: \(restaurantList.count)")
                self.restaurantList = restaurantList
            }).store(in: &subscription)
    }
}
