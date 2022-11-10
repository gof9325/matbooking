//
//  Restaurant.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import Foundation

struct Restaurant: Equatable, Codable, Hashable {
    let id: String
    var reservationRestrictions: ReservationRestrictions
    var storeInfo: StoreInfo
    var imagesData = [Data]()
}
