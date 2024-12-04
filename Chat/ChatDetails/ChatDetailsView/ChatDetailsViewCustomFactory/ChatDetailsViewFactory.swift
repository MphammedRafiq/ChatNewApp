//
//  ChatDetailsViewCustomFactory.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import StreamChat
import StreamChatSwiftUI

extension ChatDetailsViewFactor {
    
   static func makeChannelHeaderViewModifier(for channel: ChatChannel) -> ChatDetailsHeaderModifier {
        ChatDetailsHeaderModifier(channel: channel)
    }
}


