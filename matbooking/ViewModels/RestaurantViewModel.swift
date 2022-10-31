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
    @Published var restaurantList = [Restaurant]()
      
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
