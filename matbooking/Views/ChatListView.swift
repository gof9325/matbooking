//
//  ChatView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/04.
//

import SwiftUI

struct ChatListView: View {
    
    var chatList = [
        "a", "b"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chatList, id:\.self) { item in
                    Text(item)
                }
            }
            .navigationTitle("채팅 목록")
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
