//
//  Chat.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/11.
//

import Foundation

struct ChatSocketSend: Codable, Hashable {
    var id = UUID()
    var event = "message-to-store"
    let data: ChatData
    
    struct ChatData: Codable, Hashable {
        let to: String
        let message: String
    }
}
