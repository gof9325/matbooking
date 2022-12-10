//
//  RestaurantsRouter.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/05.
//

import Foundation
import Alamofire

struct GetRestaurantsFilters: Equatable {
    var name: String = ""
    var cuisine: String = ""
}

enum RestaurantsRouter: URLRequestConvertible {
    
    case getRestaurants(query: GetRestaurantsFilters)
    case downloadImage(url: String)
    
    var baseURL: URL {
        switch self {
        case let .downloadImage(url):
            return URL(string: url)!
        default:
            return URL(string: ApiClient.BASE_URL)!
        }
    }
    
    var endPoint: String {
        switch self {
        case .getRestaurants:
            return "stores"
        case .downloadImage:
            return ""
        }
    
    }
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: Parameters{
        switch self {
        case let .getRestaurants(query):
            var parameters = Parameters()
            if !query.name.isEmpty {
                parameters["name"] = query.name
            }
            if !query.cuisine.isEmpty {
                parameters["cuisine"] = query.cuisine
            }
            return parameters
        default: return Parameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url: URL
        if !endPoint.isEmpty {
            url = baseURL.appendingPathComponent(endPoint)
        } else {
            url = baseURL
        }
        var request = URLRequest(url: url)
        request.method = method
        if method == .get {
            request.url = (try URLEncodedFormParameterEncoder.default.encode(parameters as? [String: String], into: request)).url
        }
        return request
    }
}
