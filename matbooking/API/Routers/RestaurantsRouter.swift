//
//  RestaurantsRouter.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/05.
//

import Foundation
import Alamofire

enum RestaurantsRouter: URLRequestConvertible {
    
    case getRestaurants
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
        return request
    }
}
