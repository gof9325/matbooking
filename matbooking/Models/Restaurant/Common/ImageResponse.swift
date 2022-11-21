//
//  ImageResponse.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/10.
//

import Foundation

struct ImageResponse: Codable, Equatable, Hashable {
    let id: String
    let fileFolderId: String
    let url: String
}
