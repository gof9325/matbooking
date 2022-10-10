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
    @Published var user: User?
    
    @Published var haveToJoin: Bool = false
    
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
                    print("accessToken : \(credentials.accessToken)")
                    KeyChain.create(key: "userAccessToken", token: credentials.accessToken)
                    if let auth0User = Auth0User(from: credentials.idToken) {
                        self.getUserInfo(auth0User)
                        self.auth0User = auth0User
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
                    self.user = nil
                    KeyChain.delete(key: "userAccessToken")
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func join(name: String, mobile: String, _ auth0User: Auth0User) {
        print("UserViewModel - join() called")
        UserApiService.join(name: name, mobile: mobile)
            .sink(receiveCompletion: { completion in
                print("UserViewModel join completion: \(completion)")
            }, receiveValue: { userInfo in
                self.user = User(id: auth0User.id, picture: auth0User.picture, name: name, mobile: mobile)
            }).store(in: &subscription)
    }
    
    private func getUserInfo(_ auth0User: Auth0User) {
        print("UserViewModel - getUserInfo() called")
        UserApiService.getUserInfo()
            .sink(receiveCompletion: { completion in
                print("UserViewModel getUserInfo completion: \(completion)")
            }, receiveValue: { userInfo in
                if userInfo.data.exists {
                    self.user = User(id: auth0User.id, picture: auth0User.picture, name: userInfo.data.name!, mobile: userInfo.data.mobile!)
                } else {
                    self.haveToJoin = true
                }
            }).store(in: &subscription)
    }
    
    func deleteAccount() {
        print("UserViewModel - getUserInfo() called")
        UserApiService.deleteAccount()
            .sink(receiveCompletion: { completion in
                print("UserViewModel deleteAccount completion: \(completion)")
            }, receiveValue: { result in
//                result.error != nil {
                    self.user = nil
                    self.auth0User = nil
//                }
            }).store(in: &subscription)
    }
}
