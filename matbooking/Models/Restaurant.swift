//
//  Restaurant.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import Foundation
//import SwiftUI

struct Restaurant: Hashable {
    let id = UUID()
    let name: String
    var isOpen: Bool
    let introduction: String
//    let pictures: String
}
