//
//  Reservation.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import Foundation

struct Reservation: Hashable {
    let id = UUID()
    var date: Date
    let pax: Int
    let restaurantName: String
}
