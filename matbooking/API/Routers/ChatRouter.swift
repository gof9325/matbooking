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
    case getChatDetailList(id: String)
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .getChatList:
            return "chat-messages"
        case let .getChatDetailList(id):
            return "stores/\(id)/chat-messages"
        }
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getChatList, .getChatDetailList:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url: URL = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
}
