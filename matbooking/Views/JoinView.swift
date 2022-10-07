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
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("맛북킹 회원가입")
                    .font(.largeTitle)
                    .padding()
                Text("프로필 이미지")
                AsyncImage(url: URL(string: userVM.user?.picture ?? ""))
                { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .scaledToFit()
                .padding()
                .cornerRadius(100)
                Spacer()
                Spacer()
                Form {
                    Section("닉네임") {
                        TextField("닉네임", text: $name)
                    }
                    Section("전화번호") {
                        TextField("000-0000-0000", text: $mobile)
//                        TextField("000-0000-0000", value: $mobile, format: .format(.))
                    }
                }
                .padding()
                .cornerRadius(80)
                HStack {
                    Spacer()
                    Button("완료") {
                        if let auth0User = userVM.auth0User {
                            userVM.join(name: name, mobile: mobile, auth0User)
                        }
                    }
                    .matbookingButtonStyle(width: 100)
                    Spacer()
                    Button("취소") {
//                        userVM.auth0User = nil
                        userVM.cancelJoin()
                    }
                    .matbookingButtonStyle(width: 100)
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

extension Button {
    func matbookingButtonStyle(width: CGFloat) -> some View {
        self
            .padding()
            .frame(width: width)
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView(isPresented: .constant(true))
    }
}
