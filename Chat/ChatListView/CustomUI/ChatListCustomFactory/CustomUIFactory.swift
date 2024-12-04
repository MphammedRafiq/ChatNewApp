//
//  CustomUIFactory.swift
//  Chat
//
//  Created by MohammedRafiq on 01/12/24.
//

import Foundation
import SwiftUI
import StreamChat
import StreamChatSwiftUI

class CustomUIFactory: ViewFactory {
    
    @Injected(\.chatClient) public var chatClient
    
    var channelId: ChannelId?
    
    private init() {}
    
    public static let shared = CustomUIFactory()
    
    func makeChannelListBackground(colors: ColorPalette) -> some View {
        BackgroundView()
    }
    
    func makeChannelListItem(
        channel: ChatChannel,
        channelName: String,
        avatar: UIImage,
        onlineIndicatorShown: Bool,
        disabled: Bool,
        selectedChannel: Binding<ChannelSelectionInfo?>,
        swipedChannelId: Binding<String?>,
        channelDestination: @escaping (ChannelSelectionInfo) -> ChatChannelView<CustomUIFactory>,
        onItemTap: @escaping (ChatChannel) -> Void,
        trailingSwipeRightButtonTapped: @escaping (ChatChannel) -> Void,
        trailingSwipeLeftButtonTapped: @escaping (ChatChannel) -> Void,
        leadingSwipeButtonTapped: @escaping (ChatChannel) -> Void
    ) -> some View {
        let listItem = ChatListItem(
            channel: channel,
            channelName: channelName,
            avatar: avatar,
            channelDestination: channelDestination,
            selectedChannel: selectedChannel) { 
                chatChannel in
                 self.channelId = chatChannel.cid
                onItemTap(chatChannel)
            }
        return ChatChannelSwipeableListItem<CustomUIFactory, ChatListItem>(
            factory: self,
            channelListItem: listItem,
            swipedChannelId: swipedChannelId,
            channel: channel,
            trailingRightButtonTapped: trailingSwipeRightButtonTapped,
            trailingLeftButtonTapped: trailingSwipeLeftButtonTapped,
            leadingSwipeButtonTapped: leadingSwipeButtonTapped
        )
    }
    

//    // 3. Customize the list divider
    func makeChannelListDividerItem() -> some View {
        //EmptyView()
        CustomListRowSeparator()
    }
//
//    // 4. Add a custom-made channel list header
    func makeChannelListHeaderViewModifier(title: String) -> some

    ChannelListHeaderViewModifier {
        CustomChannelModifier(title: title)
    }

    // 5. Remove the search bar and add a custom top view
//    func makeChannelListTopView(
//        searchText: Binding<String>
//    ) -> some View {
//        //EmptyView()
//        UserOnlineView()
//    }
//
//    // 6. Add a vertical padding to the top of the channel list
//    func makeChannelListModifier() -> some ViewModifier {
//        VerticalPaddingViewModifier()
//    }
//
//    // 7. Add floating buttons using the footer component
//    public func makeChannelListFooterView() -> some View {
//        UnreadButtonView()
//    }
//
    // 8. Make a tab bar using the sticky footer component
//    func makeChannelListStickyFooterView() -> some View {
//        WhatsAppTabView()
//    }
}
