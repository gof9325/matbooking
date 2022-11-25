//
//  ChatApiService.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/22.
//

import Foundation
import Alamofire
import Combine

enum ChatApiService {
    static func getChatList() -> AnyPublisher<[ChatListResponse], AFError> {
        print("ChatApiService - getChatList() called")

        return ApiClient.shared.session
            .request(ChatRouter.getChatList)
            .publishDecodable(type: ApiResponse<[ChatListResponse]>.self)
            .value()
            .map{ $0.data }
            .eraseToAnyPublisher()
    }
    
    static func getChatDetailList(id: String) -> AnyPublisher<[ChatDetailListResponse], AFError> {
        print("ChatApiService - getChatDetailList() called")
        
        return ApiClient.shared.session
            .request(ChatRouter.getChatDetailList(id: id))
            .publishDecodable(type: ApiResponse<[ChatDetailListResponse]>.self)
            .value()
            .map{ $0.data }
            .eraseToAnyPublisher()
    }
}
