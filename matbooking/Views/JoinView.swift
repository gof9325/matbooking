//
//  JoinView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/01.
//

import SwiftUI

struct JoinView: View {
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            VStack {
                Text("맛북킹 회원가입")
                    .font(.largeTitle)
                    .padding()
                Text("프로필 이미지")
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .background(.gray)
                    .cornerRadius(100)
                Spacer()
                Spacer()
                Form {
                    Section("닉네임") {
                        TextField("닉네임", text: $name)
                    }
                    Section("전화번호") {
                        TextField("000-0000-0000", text: $phoneNumber)
                    }
                }
                .padding()
                .cornerRadius(80)
                HStack {
                    Spacer()
                    Button("완료") {
                        // 회원가입 완료
                    }
                    .padding()
                    .frame(width: 100)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    Spacer()
                    Button("취소") {
                        self.dismiss()
                    }
                    .padding()
                    .frame(width: 100)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    Spacer()
                }
            }
        }
        
    }
}

struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView()
    }
}
