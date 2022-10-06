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
    static func getUserInfo() -> AnyPublisher< UserResponse , AFError> {
        print("UserApiService - getUserInfo() called")
        
        let interceptor = Auth0Interceptor()
        
        return ApiClient.shared.session
            .request(UserRouter.getUserInfo, interceptor: interceptor)
            .publishDecodable(type: UserResponse.self)
            .value()
            .eraseToAnyPublisher()
    }
}
