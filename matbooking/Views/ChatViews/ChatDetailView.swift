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
            ScrollView(showsIndicators: false) {
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
                        }
                    }
                Spacer()
            }
            .navigationBarTitle("\(restuarant.store.storeInfo.name)님 과의 대화")
            .navigationBarTitleDisplayMode(.inline)
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
//        ChatDetailView(chatVM: ChatViewModel(), chatDetailList: [ChatDetail(id: "", createdAt: Date(), message: "asdfe", type: .CustomerToStore)], needsToControlTabbar: true, restuarant: ChatListResponse(message: "asdf", store: Store(id: "", storeInfo: StoreInfo(name: "가게이름", subtitle: "가게설명", picturesFolderId: "", pictures: nil, description: "", address: "", phone: "", openingHours: "", city: "", cuisine: "")), createdAt: "2022-11-23T08:39:34.000Z"))
//    }
//}
