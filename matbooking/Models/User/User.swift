//
//  User.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/06.
//

import Foundation

struct User: Codable {
    var id: String = ""
    var picture: String = ""
    let name: String
    let mobile: String
}
