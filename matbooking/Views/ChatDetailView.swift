//
//  ChatDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/07.
//

import SwiftUI

struct ChatDetailView: View {
    @State var inputText: String = ""
    
    var body: some View {
        VStack {
            Text("황가네 돼지국밥집 님과의 대화")
                .padding()
            LazyVStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                        .padding()
                        .background(.gray.opacity(0.5))
                        .clipShape(Circle())
                    Text("어쩌고 저쩌고")
                        .padding()
                        .background(Color.matPeach)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            HStack {
                TextField("", text: $inputText)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(15)
                Button("send") {
                    
                }
                .matbookingButtonStyle(width: 80, color: Color.matPeach)
            }
        }
        .padding()
    }
}

struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDetailView()
    }
}
