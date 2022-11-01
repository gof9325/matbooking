//
//  MakeResrvationsView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct MakeReservationsView: View {
    
//    @StateObject var restaurantVM: RestaurantViewModel
//
//    var restaurant: Restaurant
    
    @Environment(\.dismiss) var dismiss
    
//    @Binding var reservation: Reservation
    
    @State var date = Date()
    @State var pax = 0
    
    var reservableTimeslots = ["ㅁ", "ㅇti"]
    
    var body: some View {
        VStack {
            DatePicker(
                "date",
                selection: $date,
                in: Date()...,
                displayedComponents: [.date]
                )
                .accentColor(Color.pink)
                .datePickerStyle(.graphical)
                .padding()
                .onChange(of: date, perform: { newDate in
                    // newDate기준으로 reservableTimeslots 갱신
                })
            Stepper(value: $pax, in: 0...5) {
                Image(systemName: "person.2")
                Text("인원")
                Text("\(pax)")
            }
            .padding()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(reservableTimeslots, id:\.self) { time in
                        Button(time) {
                            
                        }
                    }
                }
            }
            .padding()
            Button("닫기") {
                self.dismiss()
            }
            .matbookingButtonStyle(width: .infinity)
            // 예약 인원
            // 예약 금액
        }
        .padding()
        .onAppear {
//            restaurantVM.getReservableTimeslots(startTime: restaurant.reservationRestrictions.daysReservableInFuture., endTime: <#T##Date#>, slotGap: <#T##Int#>)
        }
    }
}

//struct MakeResrvationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MakeReservationsView(reservation: .constant(Reservation(date: Date(), pax: "2", restaurantName: "asdf")))
//            .previewLayout(.sizeThatFits)
//            .frame(width: 100, height: 500)
//    }
//}
