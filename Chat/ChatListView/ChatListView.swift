//
//  ChatListView.swift
//  Chat
//
//  Created by MohammedRafiq on 29/11/24.
//

import SwiftUI
import GoogleSignIn
import StreamChatSwiftUI
import StreamChat

struct ChatListView: View {
      
      var body: some View {
          ChatChannelListView(viewFactory: CustomUIFactory.shared)
              .background(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)))
      }
  }


#Preview {
    ChatListView()
}


class CustomViewFactory: ViewFactory {
    @Injected(\.chatClient) public var chatClient

    func makeMessageTextView(for message: ChatMessage,
                             isFirst: Bool,
                             availableWidth: CGFloat) -> some View {
        return CustomMessageTextView(message: message, isFirst: isFirst)
    }
}

struct CustomMessageTextView: View {
    @Injected(\.colors) var colors
    @Injected(\.fonts) var fonts

    var message: ChatMessage
    var isFirst: Bool

    public var body: some View {
        Text(message.text)
            .padding()
            .messageBubble(for: message, isFirst: isFirst)
            .foregroundColor(Color(colors.text))
            .font(fonts.bodyBold)
            .overlay(
                BottomRightView {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .offset(x: 1, y: -1)
                }
            )
    }
}
