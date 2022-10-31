//
//  MakeResrvationsView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct MakeResrvationsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var reservation: Reservation
    
    @State var pax = 0
    
    var time = ["ㅁ", "ㅇti"]
    
    var body: some View {
        VStack {
            DatePicker(
                "date",
                selection: $reservation.date,
                in: Date()...,
                displayedComponents: [.date]
                )
                .accentColor(Color.pink)
                .datePickerStyle(.graphical)
            Stepper(value: $pax, in: 0...5) {
                Text("인원")
                Text("\(pax)")
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(time, id:\.self) { time in
                        Button(time) {
                            
                        }
                    }
                }
            }
          
            Button("닫기") {
                self.dismiss()
            }
            .matbookingButtonStyle(width: .infinity)
            // 예약 인원
            // 예약 금액
//            clipped()
        }
    }
}

struct MakeResrvationsView_Previews: PreviewProvider {
    static var previews: some View {
        MakeResrvationsView(reservation: .constant(Reservation(date: Date(), pax: "2", restaurantName: "asdf")))
            .previewLayout(.sizeThatFits)
//            .frame(width: 100, height: 500)
    }
}
