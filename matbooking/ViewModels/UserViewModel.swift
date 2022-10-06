//
//  UserViewModel.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/04.
//

import Foundation
import Auth0
import Security
import Combine
import Alamofire

class UserViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    @Published var auto0User: Auth0User?
    @Published var user: User? = nil
    
    init(from: String) {
        self.auto0User = Auth0User(from: from)
    }
    
    // MARK: Intant functions
    func login(){
        Auth0
            .webAuth()
            .audience("memos-node-docker")
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Auth0Login Successs")
                    self.auto0User = Auth0User(from: credentials.idToken)!
                    print("accessToken : \(credentials.accessToken)")
                    KeyChain.create(key: "userAccessToken", token: credentials.accessToken)
                    self.getUserInfo()
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func logout() {
        Auth0
            .webAuth()
            .audience("memos-node-docker")
            .clearSession { result in
                switch result {
                case .success:
                    self.auto0User = nil
                    KeyChain.delete(key: "userAccessToken")
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func getUserInfo() {
        print("UserViewModel - getUserInfo() called")
        UserApiService.getUserInfo()
            .sink(receiveCompletion: { completion in
                print("UserViewModel getUserInfo completion: \(completion)")
            }, receiveValue: { userInfo in
                self.user = User(id: self.auto0User?.id ?? "", picture: self.auto0User?.picture ?? "", name: userInfo.name, mobile: userInfo.mobile)
            }).store(in: &subscription)
    }
}
