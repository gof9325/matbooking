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
                    LoginField(label: "id", value: "")
                    LoginField(label: "pw", value: "")
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
                    NavigationLink("회원가입") {
                        JoinView()
                    }
                    Text("|")
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

struct LoginField: View {
    
    let label: String
    @State var value: String
    
    var body: some View {
        HStack {
            TextField("\(label)", text: $value)
                .padding(5)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        LoginField(label: "id", value: "abcas")
            .previewLayout(.sizeThatFits)
    }
}
