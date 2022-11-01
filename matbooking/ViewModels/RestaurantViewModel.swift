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
    
    func getReservableTimeslots(startTime: Date, endTime: Date, slotGap: Int) -> [Date] {
        var timeslots = [startTime]
        let gapTime = slotGap / 60
        let timeGap = Int((endTime.timeIntervalSince(startTime)) / 60) / 60
        
        let slotsCount = gapTime / timeGap
        
        var resultTime = startTime
        
        for _ in 0...slotsCount {
            if let time = Calendar.current.date(byAdding: .hour, value: gapTime, to: resultTime) {
                if time < endTime {
                    timeslots.append(time)
                    resultTime = time
                }
            }
        }
        return timeslots
    }
    
}
