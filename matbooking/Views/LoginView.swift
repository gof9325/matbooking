//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var user: UserViewModel
    @Binding var isLoginSuccess: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("맛북킹")
                    .font(.title)
                    .padding([.top, .bottom])
                Button("Login") {
                    user.login()
                    isLoginSuccess = user.user == nil ? false : true
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                HStack {
                    NavigationLink("회원가입") {
                        JoinView()
                    }
                    Text("|")
                    NavigationLink("아이디/비밀번호 찾기") {
                        //                        RestaurantListView()
                    }
                }
                .foregroundColor(.gray)
                .padding()
            }
            .frame(width: 300, height: 200)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(user: UserViewModel(from: ""),isLoginSuccess: .constant(true))
    }
}
