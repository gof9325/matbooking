//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginSuccess = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("맛북킹")
                    .font(.title)
                VStack {
                    LoginFiled(filed: "id", value: "")
                    LoginFiled(filed: "pw", value: "")
                }
                .padding([.top, .bottom])
                NavigationLink("Login") {
                    RestaurantListView()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                HStack {
                    NavigationLink("회원가입  |") {
                        RestaurantListView()
                    }
                    NavigationLink("아이디/비밀번호 찾기") {
                        RestaurantListView()
                    }
                }
                .foregroundColor(.gray)
                .padding()
            }
            .frame(width: 300, height: 200)
        }
    }
}

struct LoginFiled: View {
    
    let filed: String
    @State var value: String
    
    var body: some View {
        HStack {
            Text("\(filed) :")
                .font(.headline)
                .frame(width: 50)
            TextField("\(filed)", text: $value)
                .padding(5)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        LoginFiled(filed: "id", value: "abcas")
            .previewLayout(.sizeThatFits)
    }
}
