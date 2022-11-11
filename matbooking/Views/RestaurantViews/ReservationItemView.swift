//
//  ReservationItemView.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/04.
//

import SwiftUI

import SwiftUI

struct ReservationItemView: View {
    var body: some View {
        VStack {
            HStack {
                Text("테스트 가게")
                Spacer()
                Text("2022-03-10 월요일")
            }
            .padding()
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.matLightPink)
            HStack {
                Image(systemName: "person.2")
                Text("22 명")
                Spacer()
                Image(systemName: "clock")
                Text("오전 09:00")
            }
            .padding()
        }
        .padding()
        .background(Color.matPeach)
        .foregroundColor(Color.matBlack)
        .cornerRadius(20)
    }
}

struct ReservationItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationItemView()
    }
}
