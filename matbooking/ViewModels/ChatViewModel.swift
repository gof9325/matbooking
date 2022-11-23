//
//  ChatViewModel.swift
//  matbooking
//
//  Created by 황경원 on 2022/11/22.
//

import Foundation
import Alamofire
import Combine


class ChatViewModel: ObservableObject {
    private var subscription = Set<AnyCancellable>()
    
    enum chatListLoadingState {
        case beforeLoad, loading, didLoaded
    }
    
    let socket = CodableWebSocket(url:URL(string:"ws://165.22.105.229:3001")!)
    
    @Published var chatList: [ChatListResponse]?
    @Published var chatListLoadingState: chatListLoadingState = .beforeLoad
    
    func getChatList() {
        print("ChatViewModel - getChatList() called")
        ChatApiService.getChatList()
            .sink(receiveCompletion: { completion in
                print("ChatViewModel getChatList completion: \(completion)")
                self.chatListLoadingState = .didLoaded
            }, receiveValue: { chatList in
                self.chatList = chatList
            }).store(in: &subscription)
    }
    
}
