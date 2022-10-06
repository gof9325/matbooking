//
//  UserDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var user: UserViewModel
    @ObservedObject var reservationList: ReservationViewModel
    
    @Binding var isLoginSuccess: Bool
    var body: some View {
        
        VStack {
            Text("마이페이지")
                .font(.largeTitle)
            VStack {
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .background(.gray.opacity(0.3))
                        .cornerRadius(100)
                        .frame(width: 150, height: 150)
                        .padding()
                    Text(user.user?.id ?? "" )
                        .font(.largeTitle)
                }
                Button("로그아웃") {
                    user.logout()
                    isLoginSuccess = false
                }
            }
            NavigationView {
                List {
                    
                    Text("asdf")
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: UserViewModel(from: ""), reservationList: ReservationViewModel(), isLoginSuccess: .constant(true))
    }
}
