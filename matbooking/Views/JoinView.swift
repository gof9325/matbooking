//
//  JoinView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import SwiftUI

struct JoinView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var name: String = ""
    @State var mobile: String = ""
    
    @State var validateMobileNumber = true
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("맛북킹 회원가입")
                    .font(.largeTitle)
                    .padding()
                VStack {
                    TextField("닉네임", text: $name)
                        .padding(9)
                        .background(.white)
                        .cornerRadius(10)
                    TextField("00000000000", text: $mobile)
                        .keyboardType(.phonePad)
                        .padding(9)
                        .background(.white)
                        .cornerRadius(10)
                }
                .padding([.top, .bottom], 10)
                .padding(30)
                .background(Color.matSkin)
                .cornerRadius(10)
                .padding()
                HStack {
                    Spacer()
                    Button("완료") {
                        if let auth0User = userVM.auth0User {
                            userVM.join(name: name, mobile: mobile, auth0User)
                        }
                    }
                    .matbookingButtonStyle(width: 100, color: Color.matPeach)
                    Spacer()
                    Button("취소") {
                        isPresented = false
                    }
                    .matbookingButtonStyle(width: 100, color: Color.matPeach)
                    Spacer()
                }
                .onReceive(userVM.$user, perform: {
                    if $0 != nil {
                        isPresented = false
                    }
                })
            }
        }
        
    }
}
