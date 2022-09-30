//
//  RestaurantItem.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct RestaurantContentView: View {
    
    
    
    
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
                .background(.green)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("감자 순대국밥")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 5)
                        .padding(.bottom, -3)
                    Text("예약가능")
                        .padding(5)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                Spacer()
                Text("어쩌고 저쩌고 어쩔티비 저쩔티비 블라블라 맛있다 어쩌고 저짜고 룰루랄라asdfasdfasdfasdfasdfasdfasdfasdfasdfsdfasdfasdfasdfasdfasdfxcvdfasdf")
            }
            .padding(.leading, 3)
        }
        .frame(height: 150)
        .scaledToFit()
        .padding()
    }
}

struct RestaurantItem_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantContentView()
            .previewLayout(.sizeThatFits)
            .frame(width: 500)
    }
}
