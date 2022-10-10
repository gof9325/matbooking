//
//  UserService.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/06.
//

import Foundation
import Alamofire
import Combine

enum UserApiService {
    
    static func getUserInfo() -> AnyPublisher<ApiResponse<UserResponse>, AFError> {
        print("UserApiService - getUserInfo() called")
        
        return ApiClient.shared.session
            .request(UserRouter.getUserInfo)
            .publishDecodable(type: ApiResponse<UserResponse>.self)
            .value()
            .eraseToAnyPublisher()
    }
    
    static func join(name: String, mobile: String) -> AnyPublisher<ApiResponse<JoinResponse>, AFError> {
        print("UserApiService - join() called")
        
        return ApiClient.shared.session
            .request(UserRouter.join(name: name, mobile: mobile))
            .publishDecodable(type: ApiResponse<JoinResponse>.self)
            .value()
            .eraseToAnyPublisher()
    }
    
    static func deleteAccount() -> AnyPublisher<ApiResponse<EmptyResponse>, AFError> {
        print("UserApiService - deleteAccount() called")
        
        return ApiClient.shared.session
            .request(UserRouter.deleteAccount)
            .publishDecodable(type: ApiResponse<EmptyResponse>.self)
            .value()
            .eraseToAnyPublisher()
    }
}
