//
//  ChatAuth.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/22.
//

import Foundation

struct ChatAuth: Codable {
    var event = "auth"
    var data = ChatAuth.Data()
    
    struct Data: Codable {
        var Authorization = "Bearer " + (KeyChain.read(key: "userAccessToken") ?? "")
    }
}
