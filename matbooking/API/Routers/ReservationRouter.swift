//
//  ReservationRouter.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/12.
//

import Foundation
import Alamofire

enum ReservationRouter: URLRequestConvertible {
    case createReservation(storeId: String, pax: Int, date: String, time: String)
    case getReservations
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .createReservation, .getReservations:
            return "reservations"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .createReservation:
            return .post
        case .getReservations:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case let .createReservation(storeId, pax, date, time):
            var parameters = Parameters()
            parameters["storeId"] = storeId
            parameters["pax"] = pax
            parameters["date"] = date
            parameters["time"] = time
            return parameters
        case .getReservations:
            return Parameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = method
        if method == .post {
            request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        }
        return request
    }
}
