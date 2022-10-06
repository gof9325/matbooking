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
    @Published var auth0User: Auth0User?
    @Published var user: User? = nil
    
    init(from: String) {
        self.auth0User = Auth0User(from: from)
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
                    self.auth0User = Auth0User(from: credentials.idToken)!
                    print("accessToken : \(credentials.accessToken)")
                    KeyChain.create(key: "userAccessToken", token: credentials.accessToken)
                    if let auth0User = self.auth0User {
                        self.getUserInfo(auth0User)
                    }
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
                    self.auth0User = nil
                    KeyChain.delete(key: "userAccessToken")
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func getUserInfo(_ auth0User: Auth0User) {
        print("UserViewModel - getUserInfo() called")
        UserApiService.getUserInfo()
            .sink(receiveCompletion: { completion in
                print("UserViewModel getUserInfo completion: \(completion)")
            }, receiveValue: { userInfo in
                if userInfo.data.exists {
                    // 유저가 있다
                    self.user = User(id: auth0User.id, picture: auth0User.picture, name: userInfo.data.name!, mobile: userInfo.data.mobile!)
                }
            }).store(in: &subscription)
    }
}
