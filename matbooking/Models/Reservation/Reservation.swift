//
//  Reservation.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import Foundation

struct Reservation: Hashable {
    let id: String
    var date: String
    var pax: Int
    let restaurantName: String
}
