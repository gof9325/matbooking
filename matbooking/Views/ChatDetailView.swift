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
            LazyVStack(alignment: .leading) {
                Text("asdf")
                Text("asdf")
                Text("asdf")
                Text("asdf")
            }
            .background(.gray.opacity(0.3))
            Spacer()
            HStack {
                TextField("", text: $inputText)
                    .padding()
                    .background(.gray.opacity(0.5))
                    .cornerRadius(15)
                Button("send") {
                    
                }
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
