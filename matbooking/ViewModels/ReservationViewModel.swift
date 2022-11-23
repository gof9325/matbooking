//
//  ReservationViewModel.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import Foundation
import Alamofire
import Combine

class ReservationViewModel: ObservableObject {
    private var subscription = Set<AnyCancellable>()
    
    @Published var reservationList = [Reservation]()
    
    // MARK: Intant functions
    func getReservations() {
        print("ReservationViewModel - getReservations() called")
        ReservationApiService.getReservations()
            .sink(receiveCompletion: { completion in
                print("ReservationViewModel getReservations completion: \(completion)")
            }, receiveValue: { reservations in
                for reservation in reservations {
                    self.reservationList.append(Reservation(id: reservation.id, date: reservation.date, pax: reservation.pax, restaurantName: reservation.store.storeInfo.name))
                }
            }).store(in: &subscription)
    }
    
    func createReservation(storeId: String, pax: Int, date: String, time: String) {
        print("ReservationViewModel - createReservation() called")
        ReservationApiService.createReservation(storeId: storeId, pax: pax, date: date, time: time)
            .sink(receiveCompletion: { completion in
                print("ReservationViewModel getReservations completion: \(completion)")
            }, receiveValue: { reservations in
            }).store(in: &subscription)
    }
}
