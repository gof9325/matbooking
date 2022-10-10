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
        
        let interceptor = Auth0Interceptor()
        
        return ApiClient.shared.session
            .request(UserRouter.getUserInfo, interceptor: interceptor)
            .publishDecodable(type: ApiResponse<UserResponse>.self)
            .value()
            .eraseToAnyPublisher()
    }
    
    static func join(name: String, mobile: String) -> AnyPublisher<ApiResponse<JoinResponse>, AFError> {
        print("UserApiService - join() called")
        
        let interceptor = Auth0Interceptor()
        
        return ApiClient.shared.session
            .request(UserRouter.join(name: name, mobile: mobile), interceptor: interceptor)
            .publishDecodable(type: ApiResponse<JoinResponse>.self)
            .value()
            .eraseToAnyPublisher()
    }
    
    static func deleteAccount() -> AnyPublisher<ApiResponse<EmptyResponse>, AFError> {
        print("UserApiService - deleteAccount() called")
        
        let interceptor = Auth0Interceptor()
        
        return ApiClient.shared.session
            .request(UserRouter.deleteAccount, interceptor: interceptor)
            .publishDecodable(type: ApiResponse<EmptyResponse>.self)
            .value()
            .eraseToAnyPublisher()
    }
}
