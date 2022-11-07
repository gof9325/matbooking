//
//  ChatView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/04.
//

import SwiftUI

struct ChatListView: View {
    
    var chatList = [
        Chat(restaurantName: "가게 이름1", content: "채팅 내용1"),
        Chat(restaurantName: "가게 이름2", content: "채팅 내용2")
    ]
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(chatList, id:\.self) { item in
                        NavigationLink(destination: ChatDetailView()) {
                            ChatListItemView(chat: item)
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}