//
//  ApiClient.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/05.
//

import Foundation
import Alamofire

final class ApiClient {
        
    static let shared = ApiClient([BaseInterceptor(), Auth0Interceptor()])
    
    static let imageDownloadShared = ApiClient([BaseInterceptor()])
    
    static let BASE_URL = "http://165.22.105.229:3000/"
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session
    
    init(_ interceptors: [RequestInterceptor]) {
        print("ApiClient - init() called")
        session = Session(interceptor: Interceptor(interceptors: interceptors), eventMonitors: monitors)
    }
}
