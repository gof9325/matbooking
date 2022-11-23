//
//  ChatRouter.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/22.
//

import Foundation
import Alamofire

enum ChatRouter: URLRequestConvertible {
    
case getChatList
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .getChatList:
            return "chat-messages"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getChatList:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url: URL = baseURL.appendingPathComponent(endPoint)
        
//        if !endPoint.isEmpty {
//            url = baseURL.appendingPathComponent(endPoint)
//        } else {
//            url = baseURL
//        }
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
}
