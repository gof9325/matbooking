//
//  ReservationResponse.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/12.
//

import Foundation

struct ReservationResponse: Codable {
    let id: String
    let date: String
    let pax: Int
    let store: Store
}

struct Store: Codable, Hashable {
    let id: String
    let storeInfo: StoreInfo
}
