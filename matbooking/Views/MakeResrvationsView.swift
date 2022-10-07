//
//  MakeResrvationsView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct MakeResrvationsView: View {
    @Binding var reservation: Reservation
    
    var body: some View {
        VStack {
            DatePicker(selection: $reservation.date, in: Date()..., label: { Text("예약날짜") })
                .datePickerStyle(.graphical)
            Button("asdf") {
                
            }
            // 예약 인원
            // 예약 금액
            clipped()
        }
    }
}

struct MakeResrvationsView_Previews: PreviewProvider {
    static var previews: some View {
        MakeResrvationsView(reservation: .constant(Reservation(date: Date(), pax: 2, restaurantName: "asdf")))
//            .previewLayout(.sizeThatFits)
//            .frame(width: 100)
    }
}
