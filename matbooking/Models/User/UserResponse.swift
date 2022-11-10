//
//  UserResponse.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/06.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let exists: Bool
    let name: String?
    let mobile: String?
}

