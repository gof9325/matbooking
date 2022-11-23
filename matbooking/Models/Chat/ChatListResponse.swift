//
//  ChatListResponse.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/22.
//

import Foundation

struct ChatListResponse: Codable, Hashable {
    let message: String
    let store: Store
    let createdAt: String
}
