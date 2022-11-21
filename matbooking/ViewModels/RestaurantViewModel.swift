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
    @Published var currentRestaurantImages = [Data]()
    
    var getImageFinished = PassthroughSubject<
    [Data], Never>()
    
    func getImages(myRestaurant: Restaurant) {
        print("RestaurantViewModel - getImages() called")

        guard let restaurantPictures = myRestaurant.storeInfo.pictures, let restaurantIndex = self.restaurantList.firstIndex(where: {
            $0.id == myRestaurant.id
        })
        else {
            return
        }
        
        let imageUrls = restaurantPictures.compactMap { i in
            return i.url
        }
        
        imageUrls.publisher.flatMap { url in
            RestaurantsApiService.downloadImage(imageUrl: url)
        }.collect()
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let err):
                print("RestaurantViewModel getImages err: \(err)")
            case .finished:
                print("RestaurantViewModel getImages finished")
            }
        }, receiveValue: { imageDataList in
            print("RestaurantViewModel getImages value receive")
//            self.restaurantList[restaurantIndex].imagesData = imageDataList
            self.getImageFinished.send(imageDataList)
        }).store(in: &subscription)
    }
    
    func getImageForRestaurant(restaurant: Restaurant) -> AnyPublisher<Restaurant, AFError> {
        if let pictures = restaurant.storeInfo.pictures, !restaurant.storeInfo.pictures!.isEmpty {
            var newRestaurant = restaurant
            return RestaurantsApiService.downloadImage(imageUrl: pictures[0].url).map { data -> Restaurant in
                newRestaurant.imagesData.append(data)
                return newRestaurant
            }.eraseToAnyPublisher()
        } else {
            return [restaurant].publisher.setFailureType(to: AFError.self).eraseToAnyPublisher()
        }
    }
    
   
    
    // MARK: intent functions
    func getRestaurantList() {
        print("RestaurantViewModel - getRestaurantList() called")
        RestaurantsApiService.getRestaurants()
            .flatMap { restaurantList -> AnyPublisher<RestaurantResponse, Never> in
                restaurantList.publisher.eraseToAnyPublisher()
            }.flatMap({
                // RestaurantResponse -> Restaurant
                self.getImageForRestaurant(restaurant: $0.convertToRestaurant())
            }).collect()
            .sink(receiveCompletion: { completion in
                print("RestaurantViewModel getRestaurantList completion: \(completion)")
            }, receiveValue: { restaurantList in
                self.restaurantList = restaurantList
            }).store(in: &subscription)
    }
    
    func setResrvableTimeslots(date: Date, restaurant: Restaurant) -> [String]? {
        let days = ["월":"1", "화":"2", "수":"3", "목":"4", "금":"5", "토":"6", "일":"0"]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEEE"
        dateFormatter.locale = Locale(identifier: "ko")
        
        let selectedDay = dateFormatter.string(from: date)
        
        if let day = days[selectedDay] {
            if let openingHours = restaurant.reservationRestrictions.openingHours[day] {
                
                dateFormatter.dateFormat = "HH:mm"
                
                let startTime = dateFormatter.date(from: openingHours.start)
                let endTime = dateFormatter.date(from: openingHours.end)
                
                return getReservableTimeslots(startTime: startTime!, endTime: endTime!, slotGap: restaurant.reservationRestrictions.slotGapMinutes)
            }
        }
        
        return nil
    }
    
    private func getReservableTimeslots(startTime: Date, endTime: Date, slotGap: Int) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        var timeslots = [dateFormatter.string(from: startTime)]
        let slotLength = slotGap / 60
        let timeGap = Int((endTime.timeIntervalSince(startTime)) / 60) / 60
        
        let slotsCount = timeGap / slotLength
        var resultTime = startTime
        
        for _ in 0..<slotsCount {
            if let time = Calendar.current.date(byAdding: .hour, value: slotLength, to: resultTime) {
                if time < endTime {
                    timeslots.append(dateFormatter.string(from: time))
                    resultTime = time
                }
            }
        }
        return timeslots
    }
    
}
