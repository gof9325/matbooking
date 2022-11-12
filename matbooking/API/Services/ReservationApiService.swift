//
//  ReservationApiService.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/12.
//

import Foundation
import Alamofire
import Combine

enum ReservationApiService {
    static func getReservations() -> AnyPublisher<[ReservationResponse], AFError> {
        print("ReservationApiService - getReservations() called")
        
        return ApiClient.shared.session
            .request(ReservationRouter.getReservations)
            .publishDecodable(type: ApiResponse<[ReservationResponse]>.self)
            .value()
            .map{ $0.data }
            .eraseToAnyPublisher()
    }
    static func createReservation(storeId: String, pax: Int, date: String, time: String) -> AnyPublisher<EmptyResponse, AFError> {
        print("ReservationApiService - createReservation() called")
        
        return ApiClient.shared.session
            .request(ReservationRouter.createReservation(storeId: storeId, pax: pax, date: date, time: time))
            .publishDecodable(type: ApiResponse<EmptyResponse>.self)
            .value()
            .map{ $0.data }
            .eraseToAnyPublisher()
    }
}
