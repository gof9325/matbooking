//
//  BaseResponse.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/07.
//

import Foundation

// MARK: - ApiResponse
struct ApiResponse<T>: Codable where T: Codable {
    let success: Bool
    let error: String
    let data: T
    let message: String
}
