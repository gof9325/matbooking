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
    
    let needsToControlTabbar: Bool
    
    let restuarant: ChatListResponse

    var body: some View {
        VStack {
            Text("\(restuarant.store.storeInfo.name) 님과의 대화")
                .padding()
            GeometryReader { proxy in
                LazyVStack {
                    // TODO: 실제 채팅 리스트 기반으로 뿌려주기
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
                        Spacer()
                    }
                    .frame(width: proxy.size.width)
                    HStack {
                        Spacer()
                        Text("어쩌고 저쩌고")
                            .padding()
                            .background(Color.matSkin)
                            .cornerRadius(20)
                            .foregroundColor(Color.matBlack)
                        Image(systemName: "person")
                            .padding()
                            .background(.gray.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .frame(width: proxy.size.width)
                }
            }
            Spacer()
            HStack {
                TextField("", text: $inputText)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(15)
                Button("send") {
                    _ = chatVM.socket.receive(.outgoingMessage(Chat(data: Chat.ChatData(to: restuarant.store.id, message: inputText))))
                }
                .matbookingButtonStyle(width: 80, color: Color.matPeach)
            }
        }
        .onAppear {
            // 인증에 대해 소켓통신으로 보내고 소켓을 엶
            _ = chatVM.socket.receive(.outgoingMessage(ChatAuth()))
            
            // TODO: 기존에 채팅내역을 가지고 와서 뿌려줌
            
        }
        .padding()
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
