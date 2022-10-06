//
//  UserResponse.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/06.
//

import Foundation

// MARK: - Welcome
struct UserResponse: Codable {
    let success: Bool
    let error: String
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let exists: Bool
    let name: String?
    let mobile: String?
}

