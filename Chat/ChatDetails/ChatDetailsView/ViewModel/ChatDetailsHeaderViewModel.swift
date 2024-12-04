//
//  ChatDetailsHeaderViewModel.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

class ChatDetailsHeaderViewModel: ObservableObject {
    
    @Injected(\.utils) var utils
    @Injected(\.chatClient) var chatClient
    
    @Published var headerImage: UIImage?
    @Published var channelName: String?
    @Published var connectionStatus: Bool?
    
    init(channel: ChatChannel) {
        headerImage = ChannelHeaderLoader().image(for: channel)
        channelName = utils.channelNamer(channel, chatClient.currentUserId ?? "")
        connectionStatus = channel.shouldShowOnlineIndicator
    }
    
}

