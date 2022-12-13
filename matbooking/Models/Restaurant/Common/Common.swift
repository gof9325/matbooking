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

struct Cuisine: Hashable {
    let name: String
    let emoji: String
    let query: String
    
    
    static var korean = Cuisine(name: "한식", systemImageName: "🥘", query: "한식")
    static var italian = Cuisine(name: "이탈리아", systemImageName: "🍕", query: "이탈리아음식")
    static var japanese = Cuisine(name: "일식", systemImageName: "🍣", query: "일식")
    static var all = Cuisine(name: "전체", systemImageName: "🍽️", query: "")
    
    static var allCases = [Cuisine.korean, Cuisine.italian, Cuisine.japanese, Cuisine.all]

    private init(name: String, systemImageName: String, query: String) {
        self.name = name
        self.emoji = systemImageName
        self.query = query
    }
}
