//
//  ReservationViewModel.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import Foundation

class ReservationViewModel: ObservableObject {
    
    @Published var reservationList: [Reservation]
    
    init() {
        reservationList = [Reservation(date: Date(), restaurantId: UUID())]
    }
}
