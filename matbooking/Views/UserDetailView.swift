//
//  UserDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct UserDetailView: View {
    @EnvironmentObject var userVM: UserViewModel
    @ObservedObject var reservationList: ReservationViewModel
    
    var body: some View {
        
        VStack {
            Text("마이페이지")
                .font(.largeTitle)
            VStack {
                HStack {
                    AsyncImage(url: URL(string: userVM.user?.picture ?? ""))
                    { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                    .cornerRadius(100)
                    .frame(width: 150, height: 150)
                    .padding()
                    Text(userVM.user?.name ?? "")
                        .font(.largeTitle)
                }
                HStack {
                    Spacer()
                    Button("로그아웃") {
                        userVM.logout()
                    }
                    .matbookingButtonStyle(width: 100, color: Color.matPeach)
                    Spacer()
                    Button("회원탈퇴") {
                        userVM.deleteAccount()
                    }
                    .matbookingButtonStyle(width: 100, color: Color.matPeach)
                    Spacer()
                }
                .padding()
           
            }
            NavigationView {
                ScrollView {
                    ReservationItemView()
                }
                .padding()
                .background(Color.matSkin)
                .cornerRadius(20)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("나의 예약목록")
            }
            .padding()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(reservationList: ReservationViewModel())
    }
}
