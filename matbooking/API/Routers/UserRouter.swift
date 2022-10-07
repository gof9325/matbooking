//
//  UserRouter.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/06.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible {
    case getUserInfo
    case join(name: String, mobile: String)
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .getUserInfo:
            return "customers/me"
        case .join:
            return "customers"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUserInfo :
            return .get
        case .join :
            return .post
        }
    }
    
    var parameters: Parameters{
        switch self {
        case .getUserInfo :
            return Parameters()
        case let .join(name, mobile) :
            var parameters = Parameters()
            parameters["name"] = name
            parameters["mobile"] = mobile
            return parameters
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
