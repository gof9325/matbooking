//
//  ChatDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/07.
//

import SwiftUI
import Introspect

struct ChatDetailView: View {
    @State var uiTabBarController: UITabBarController?
    @State var inputText: String = ""
    
    @ObservedObject var chatVM: ChatViewModel
    
    @State var chatDetailList = [ChatDetail]()
    
    let needsToControlTabbar: Bool
    
    let restuarant: ChatListResponse

    var body: some View {
        VStack {
            Text("\(restuarant.store.storeInfo.name) 님과의 대화")
                .padding()
            GeometryReader { proxy in
                LazyVStack {
                    ForEach(chatDetailList, id:\.self) { chat in
                        Group{
                            if chat.type == .CustomerToStore {
                                HStack {
                                    Spacer()
                                    Text("\(chat.message)")
                                        .padding()
                                        .background(Color.matSkin)
                                        .cornerRadius(20)
                                        .foregroundColor(Color.matBlack)
                                    Image(systemName: "person")
                                        .padding()
                                        .background(.gray.opacity(0.5))
                                        .clipShape(Circle())
                                }
                            } else {
                                HStack {
                                    Image(systemName: "person")
                                        .padding()
                                        .background(.gray.opacity(0.5))
                                        .clipShape(Circle())
                                    Text("\(chat.message)")
                                        .padding()
                                        .background(Color.matPeach)
                                        .cornerRadius(20)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            }
                        }
                        .frame(width: proxy.size.width)
                    }
                }
            }
            Spacer()
            HStack {
                TextField("", text: $inputText)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(15)
                Button("send") {
                    _ = chatVM.socket.receive(.outgoingMessage(ChatSocketSend(data: ChatSocketSend.ChatData(to: restuarant.store.id, message: inputText))))
                    chatDetailList.append(ChatDetail(id: UUID().uuidString, createdAt: Date(), message: inputText, type: .CustomerToStore))
                    inputText = ""
                }
                .matbookingButtonStyle(width: 80, color: Color.matPeach)
            }
        }
        .padding()
        .onAppear {
            _ = chatVM.socket.receive(.outgoingMessage(ChatAuth()))
            chatVM.getChatDetailList(id: restuarant.store.id)
        }
        .onReceive(chatVM.$chatDetailList, perform: {
            self.chatDetailList = $0 ?? [ChatDetail]()
            chatDetailList.sort{ return $0.createdAt < $1.createdAt }
        })
        .introspectTabBarController { (UITabBarController) in
            if needsToControlTabbar {
                UITabBarController.tabBar.isHidden = true
                uiTabBarController = UITabBarController
            }
        }.onDisappear{
            if needsToControlTabbar {
                uiTabBarController?.tabBar.isHidden = false
            }
        }
    }
}

//struct ChatDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatDetailView(needsToControlTabbar: false)
//    }
//}
