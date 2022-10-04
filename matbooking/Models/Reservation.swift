//
//  Reservation.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import Foundation

struct Reservation: Codable {
    var date: Date
    let id = UUID()
    let pax: Int
}
