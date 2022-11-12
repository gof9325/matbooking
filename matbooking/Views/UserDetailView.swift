//
//  UserDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct UserDetailView: View {
    @EnvironmentObject var userVM: UserViewModel
    @ObservedObject var reservationVM: ReservationViewModel
    
    @State var reservationList: [Reservation]?
    
    var body: some View {
        NavigationView {
            VStack {
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
                        LazyVStack {
                            if reservationList == nil {
                                ProgressView()
                            } else {
                                ForEach(reservationList!, id:\.self) { reservation in
                                    ReservationItemView(reservation: reservation)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.matSkin)
                    .cornerRadius(20)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("나의 예약목록")
                }
                .padding()
                .onAppear {
                    reservationVM.getReservations()
                }
                .onReceive(reservationVM.$reservationList, perform: {reservationList = $0})
            }
            .navigationTitle("마이페이지")
        }
        
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView(rservationVM: ReservationViewModel())
//    }
//}
