//
//  ChatListItemView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/11.
//

import SwiftUI

struct ChatListItemView: View {
    @State var chat: Chat
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .padding()
                .frame(width: 150, height: 150, alignment: .leading)
            VStack(alignment: .leading) {
                Text(chat.restaurantName)
                    .font(.largeTitle)
                    .padding()
                Text(chat.content)
                    .padding()
            }
            Spacer()
        }
    }
}

struct ChatListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListItemView(chat: Chat(restaurantName: "가게 이름1", content: "채팅내용"))
    }
}
