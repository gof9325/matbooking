//
//  UserDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import SwiftUI

struct UserDetailView: View {
//    @Binding var user: User
    @ObservedObject var user: UserViewModel
    // 로그아웃
    // 예약목록
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(100)
                    .frame(width: 150, height: 150)
                    .padding()
                Text(user.user?.id ?? "asdfasdf")
                    .font(.largeTitle)
            }
            Button("로그아웃") {
                user.logout()
            }
            
        }
        
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: UserViewModel(from: ""))
    }
}
