//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI
import Auth0

struct LoginView: View {
    @State var user: User?
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
//                Button("Login") {
//                    login()
//                }
                NavigationLink("Login") {
                    ContentView()
//                    login()
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

extension LoginView {
    func login() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Success")
                    self.user = User(from: credentials.idToken)
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func logout() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    self.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        LoginField(label: "id", value: "abcas")
            .previewLayout(.sizeThatFits)
    }
}
