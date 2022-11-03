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
                .frame(maxHeight: 100, alignment: .leading)
            VStack(alignment: .leading) {
                Text(chat.restaurantName)
                    .font(.title2)
                    .padding(5)
                Text(chat.content)
                    .padding(5)
            }
            .frame(maxHeight: 100)
            Spacer()
        }
    }
}

struct ChatListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListItemView(chat: Chat(restaurantName: "가게 이름1", content: "채팅내용 어쩌고 저쩌고 이러쿵 저러쿵 냠냠 쩝쩝 블라블라 ememememem 더 길면 어떻게 되는거지 생략되는건가 음냠냠냠냠 쩝쩝쩝쩝쩝"))
    }
}
