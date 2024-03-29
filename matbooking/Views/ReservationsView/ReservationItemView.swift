//
//  ReservationItemView.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/04.
//

import SwiftUI

struct ReservationItemView: View {
    
    let reservation: Reservation
    
    var body: some View {
        VStack {
            HStack {
                Text(reservation.restaurantName)
                Spacer()
                Text(reservation.date.formatting(to: .date) ?? "none")
            }
            .padding()
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.matLightPink)
            HStack {
                Image(systemName: "person.2")
                Text("\(reservation.pax) 명")
                Spacer()
                Image(systemName: "clock")
                Text(reservation.date.formatting(to: .time) ?? "none")
            }
            .padding()
        }
        .padding()
        .background(Color.matPeach)
        .foregroundColor(Color.matBlack)
        .cornerRadius(20)
    }
}

//struct ReservationItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationItemView()
//    }
//}
