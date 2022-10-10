//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State var isJoinViewPresented = false
    @State fileprivate var shouldShowAlert = false
    
    var body: some View {
        if isJoinViewPresented {
            JoinView(isPresented: $isJoinViewPresented)
        } else {
            VStack {
                Text("맛북킹")
                    .font(.title)
                    .padding([.top, .bottom])
                Button("시작하기") {
                    userVM.login()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .frame(width: 300, height: 200)
            .onReceive(userVM.haveToJoin, perform: {
                self.isJoinViewPresented = true
            })
            .onReceive(userVM.loginFail, perform: { 
                self.shouldShowAlert = true
            })
            .alert("로그인에 실패했습니다.", isPresented: $shouldShowAlert){
                Button("확인", role: .cancel){
                    self.dismiss()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
