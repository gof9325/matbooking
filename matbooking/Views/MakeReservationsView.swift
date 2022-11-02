//
//  MakeResrvationsView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct MakeReservationsView: View {
    
    @StateObject var restaurantVM: RestaurantViewModel

    var restaurant: Restaurant
    
    @Environment(\.dismiss) var dismiss
       
    @State var date = Date()
    @State var pax = 0
    
    @State var reservableTimeslots = [String]()
    
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
                    reservableTimeslots = restaurantVM.setResrvableTimeslots(date: newDate, restaurant: restaurant) ?? [String]()
                })
            Stepper(value: $pax, in: 0...5) {
                Image(systemName: "person.2")
                Text("인원")
                Text("\(pax)")
            }
            .padding()
            ScrollView(.horizontal) {
                HStack {
                    if !reservableTimeslots.isEmpty {
                        ForEach(reservableTimeslots, id:\.self) { time in
                            Button(time) {
                                    // 눌러지면 시간, 날짜, 인원 등을 수집해서 reservation 만들기
                            }
                            .matbookingButtonStyle(width: 100)
                        }
                    } else {
                        Text("휴무일 입니다.")
                    }
                }
            }
            .padding()
            Button("닫기") {
                self.dismiss()
            }
            .matbookingButtonStyle(width: .infinity)
        }
        .padding()
        .onAppear {
            // 최초 세팅
            reservableTimeslots = restaurantVM.setResrvableTimeslots(date: date, restaurant: restaurant) ?? [String]()
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
