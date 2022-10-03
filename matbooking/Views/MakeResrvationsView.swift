//
//  MakeResrvationsView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct MakeResrvationsView: View {
    var body: some View {
        VStack {
            DatePicker(selection: .constant(Date()), label: { Text("예약날짜") })
            // 예약 인원
            // 예약 금액
        }
    }
}

struct MakeResrvationsView_Previews: PreviewProvider {
    static var previews: some View {
        MakeResrvationsView()
    }
}
