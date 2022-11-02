//
//  Restaurant.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import Foundation

struct Restaurant: Equatable, Codable, Hashable {
    var id: String
    var reservationRestrictions = ReservationRestrictions()
    var storeInfo = StoreInfo()
    
    struct ReservationRestrictions: Codable, Equatable, Hashable {
        var paxMin = 2
        var paxMax = 4
        var slotGapMinutes = 60
        var daysReservableInFuture = 1
        var openingHours = ["0": OpeningHours(start: "09:00", end: "22:00")]
        
        struct OpeningHours: Codable, Equatable, Hashable {
            var start = ""
            var end = ""
        }
    }
    
    struct StoreInfo: Codable, Equatable, Hashable {
        var name = ""
        var subtitle = "없음"
        var pictures: String?
        var description = ""
        var address = ""
        var phone = "021234"
        var openingHours = "9"
        var city = "부산"
        var cuisine = "한식"
    }
}
