//
//  ChatListItem.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct ChatListItem: View {
    
    let channel: ChatChannel
    let channelName: String
    let avatar: UIImage
    let channelDestination: (ChannelSelectionInfo) -> ChatChannelView<CustomUIFactory>
    @Binding var selectedChannel: ChannelSelectionInfo?
    let onItemTap: (ChatChannel) -> Void
    
    var body: some View {
        ZStack {
            ChatListTableItemView(
                channelName: channelName,
                avatar: avatar,
                lastMessageAt: channel.lastMessageAt ?? Date(),
                hasUnreadMessages: channel.unreadCount.messages > 0,
                lastMessage: channel.lastMessageText ?? "No messages",
                isMuted: channel.isMuted,
                isStatusOnline: channel.shouldShowOnlineIndicator
            )
            .padding(.trailing)
            .onTapGesture {
                onItemTap(channel)
            }
            
            NavigationLink(tag: channel.channelSelectionInfo, selection: $selectedChannel) {
                // use LazyView
                channelDestination(channel.channelSelectionInfo)
            } label: {
                EmptyView()
            }
        }
    }
}
