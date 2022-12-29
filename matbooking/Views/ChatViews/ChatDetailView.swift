//
//  ChatDetailView.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/07.
//

import SwiftUI
import Introspect

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct ChatDetailView: View {
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    @State var uiTabBarController: UITabBarController?
    @State var inputText: String = ""
    
    @ObservedObject var chatVM: ChatViewModel
    
    @State var chatDetailList = [ChatDetail]()
    @State var sendNewMessage = false
    @State var messageReceived = false
    @State var isFirstSetting = true
    
    let needsToControlTabbar: Bool
    
    let restuarant: ChatListResponse
    
    private var lastChat: ChatDetail? {
        chatDetailList.last
    }
    
    private var scrollObservableView: some View {
        GeometryReader { proxy in
            let offsetY = proxy.frame(in: .global).origin.y
            Color.clear
                .preference(
                    key: ScrollOffsetKey.self,
                    value: offsetY
                )
                .onAppear { // 나타날때 뷰의 최초위치를 저장하는 로직
                    viewModel.setOriginOffset(offsetY)
                }
        }
        .frame(height: 0)
    }
    
    final class ViewModel: ObservableObject {
        var offset: CGFloat = 0
        var originOffset: CGFloat = 0
        var isCheckedOriginOffset: Bool = false
        
        func setOriginOffset(_ offset: CGFloat) {
            guard !isCheckedOriginOffset else { return }
            self.originOffset = offset
            isCheckedOriginOffset = true
        }
        
        func setOffset(_ offset: CGFloat) {
            self.offset = offset
        }
    }
    
    var body: some View {
        GeometryReader { geometryReaderProxy in
            VStack {
                ScrollViewReader { scrollViewReaderProxy in
                    ScrollView(showsIndicators: false) {
                        ZStack {
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
                                    .id(chat)
                                }
                            }
                        }
                        .onChange(of: chatDetailList, perform: { _ in
                            if isFirstSetting {
                                scrollViewReaderProxy.scrollTo(lastChat)
                                isFirstSetting = false
                            }
                            if sendNewMessage {
                                withAnimation {
                                    scrollViewReaderProxy.scrollTo(lastChat)
                                    sendNewMessage = false
                                }
                            } else {
                                if !(viewModel.offset <= 1000) { // 메세지 받았는데 가장 하단이 아니면 메세지 받음 활성화
                                    messageReceived = true
                                }
                            }
                        })
                        
                    }
                    scrollObservableView
                    if messageReceived {
                        GeometryReader {  proxy in
                            HStack {
                                HStack {
                                    Image(systemName: "person")
                                        .padding()
                                        .background(.gray.opacity(0.5))
                                        .clipShape(Circle())
                                    // 텍스트 길때 처리 -> 걍 가장 겉의 fram에 맡기면 되는듯
                                    Text("\(chatDetailList[chatDetailList.count-1].message)")
                                }
                                Spacer()
                                Image(systemName: "arrowtriangle.down.fill")
                            }
                        }
                        .padding()
                        .frame(minWidth: geometryReaderProxy.size.width, maxHeight: geometryReaderProxy.size.height / 9)
                        .onTapGesture {
                            scrollViewReaderProxy.scrollTo(lastChat)
                            
                        }
                        .foregroundColor(Color.matWhiteGreen)
                        .background(Color.matNature)
                        .cornerRadius(10)
                    }
                }
                .onPreferenceChange(ScrollOffsetKey.self) {  // 추가부분
                    viewModel.setOffset($0)
                    if viewModel.offset <= 1000 {
                        messageReceived = false
                    }
                }
                .navigationBarTitle("\(restuarant.store.storeInfo.name)님 과의 대화")
                .navigationBarTitleDisplayMode(.inline)
                HStack {
                    TextField("", text: $inputText)
                        .padding()
                        .background(.gray.opacity(0.3))
                        .cornerRadius(15)
                    Button("send") {
                        if !inputText.isEmpty {
                            _ = chatVM.socket.receive(.outgoingMessage(ChatSocketSend(data: ChatSocketSend.ChatData(to: restuarant.store.id, message: inputText))))
                            chatVM.chatDetailList?.append(ChatDetail(id: UUID().uuidString, createdAt: Date(), message: inputText, type: .CustomerToStore))
                            inputText = ""
                            sendNewMessage = true
                        }
                        print("viewModel.offset: \(viewModel.offset)")
                    }
                    .matbookingButtonStyle(width: 80, color: Color.matPeach)
                }
            }
            .padding([.trailing, .leading])
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
                isFirstSetting = true
                if needsToControlTabbar {
                    uiTabBarController?.tabBar.isHidden = false
                }
        }
        }
    }
}

//struct ChatDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatDetailView(chatVM: ChatViewModel(), chatDetailList: [ChatDetail(id: "", createdAt: Date(), message: "asdfe", type: .CustomerToStore)], needsToControlTabbar: true, restuarant: ChatListResponse(message: "asdf", store: Store(id: "", storeInfo: StoreInfo(name: "가게이름", subtitle: "가게설명", picturesFolderId: "", pictures: nil, description: "", address: "", phone: "", openingHours: "", city: "", cuisine: "")), createdAt: "2022-11-23T08:39:34.000Z"))
//    }
//}
