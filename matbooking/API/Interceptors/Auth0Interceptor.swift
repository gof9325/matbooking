//
//  UserInterceptor.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/06.
//

import Foundation
import Alamofire

class Auth0Interceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        request.headers.add(.authorization(bearerToken: KeyChain.read(key: "userAccessToken") ?? ""))
        completion(.success(request))
    }
}
