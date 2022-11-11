//
//  Chat.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/11.
//

import Foundation

struct Chat: Hashable, Codable, Identifiable {
    var id = UUID()
    let restaurantName: String
    var content: String
}
