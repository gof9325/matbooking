//
//  RestaurantsService.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/05.
//

import Foundation
import Alamofire
import Combine

enum RestaurantsService {
    static func getRestaurants() -> AnyPublisher< [Restaurant] , AFError> {
        print("RestaurantsService - getRestaurants() called")
        
        return ApiClient.shared.session
            .request(RestaurantsRouter.getRestarants)
            .publishDecodable(type: RestaurantsListResponse.self)
            .value()
            .map{ $0.data }.eraseToAnyPublisher()
    }
}
