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
    static func getRestaurants(query: GetRestaurantsFilters) -> AnyPublisher<[RestaurantResponse] , AFError> {
        print("RestaurantsApiService - getRestaurants() called")
        print("@@@@@@@@@@@ QUERY: \(query)")
        
        return ApiClient.shared.session
            .request(RestaurantsRouter.getRestaurants(query: query))
            .publishDecodable(type: ApiResponse<[RestaurantResponse]>.self)
            .value()
            .map{ $0.data }
            .eraseToAnyPublisher()
    }
    
    static func downloadImage(imageUrl: String) -> AnyPublisher<Data, AFError> {
        
        return ApiClient.imageDownloadShared.session
            .download(RestaurantsRouter.downloadImage(url: imageUrl))
            .downloadProgress { progress in
                print("download progress : \(progress)")
            }
            .response { res in
                print("res: \(res)")
            }
            .publishData()
            .value()
            .eraseToAnyPublisher()
    }
}
