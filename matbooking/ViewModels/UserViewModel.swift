//
//  UserViewModel.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/04.
//

import Foundation
import Auth0
import Security

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    init(from: String) {
        self.user = User(from: from)
    }
    
    // MARK: Intant functions
    func login(){
        Auth0
            .webAuth()
            .audience("memos-node-docker")
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Login Successs")
                    self.user = User(from: credentials.idToken)!
                    KeyChain.create(key: "userAccessToken", token: credentials.accessToken)
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
                    self.user = nil
                    KeyChain.delete(key: "userAccessToken")
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}
