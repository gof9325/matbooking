//
//  ContentView.swift
//  matbooking
//
//  Created by 황경원 on 2022/09/30.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var isJoinViewPresented = false
    
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
            .onReceive(userVM.$auth0User, perform: {
                if $0 != nil {
                    self.isJoinViewPresented = true
                }
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
