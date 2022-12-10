//
//  Common.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/10.
//

import Foundation

struct ReservationRestrictions: Codable, Equatable, Hashable {
    let paxMin: Int
    let paxMax: Int
    let slotGapMinutes: Int
    let daysReservableInFuture: Int
    let openingHours: [String:OpeningHours]
    
    struct OpeningHours: Codable, Equatable, Hashable {
        let start: String
        let end: String
    }
}

struct StoreInfo: Codable, Equatable, Hashable {
    let name: String
    let subtitle: String
    let picturesFolderId: String?
    let pictures: [ImageResponse]?
    let description: String
    let address: String
    let phone: String
    let openingHours: String
    let city: String
    let cuisine: String
}

enum Cuisine: String, CaseIterable {
    case korean = "한식", italian = "이탈리아음식", japanese = "일식"
}
