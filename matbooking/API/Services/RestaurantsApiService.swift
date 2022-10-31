//
//  RestaurantsService.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/05.
//

import Foundation
import Alamofire
import Combine

enum RestaurantsApiService {
    static func getRestaurants() -> AnyPublisher<[Restaurant] , AFError> {
        print("RestaurantsApiService - getRestaurants() called")
        
        return ApiClient.shared.session
            .request(RestaurantsRouter.getRestaurants)
            .publishDecodable(type: ApiResponse<[Restaurant]>.self)
            .value()
            .map{ $0.data }
            .eraseToAnyPublisher()
    }
}
