//
//  ChatDetailsFactory.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import Foundation
import StreamChat
import StreamChatSwiftUI

extension ChatDetailsFactory {
    
    func makeChannelHeaderViewModifier(for channel: ChatChannel) -> ChatDetailsHeaderModifier {
        ChatDetailsHeaderModifier(channel: channel)
    }
}
