//
//  ChatDetailsFactory.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI


extension CustomUIFactory {
    func makeChannelHeaderViewModifier(for channel: ChatChannel) -> ChatDetailsHeaderModifier {
        ChatDetailsHeaderModifier(channel: channel)
    }
    
    func makeMessageTextView(
        for message: ChatMessage,
        isFirst: Bool,
        availableWidth: CGFloat,
        scrolledId: Binding<String?>
    ) -> ChatMessageView {
        guard let userId = chatClient.currentUserId else {
            return ChatMessageView(message: message.text, isCurrentUser: false, isFirst: isFirst)
        }
        
        return ChatMessageView(message: message.text, isCurrentUser: userId == message.author.id, isFirst: isFirst)
    }
    
    public func makeMessageListBackground(
        colors: ColorPalette,
        isInThread: Bool
    ) -> some View {
        Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor))
    }
    
    func makeComposerInputView(
        text: Binding<String>,
        selectedRangeLocation: Binding<Int>,
        command: Binding<ComposerCommand?>,
        addedAssets: [AddedAsset],
        addedFileURLs: [URL],
        addedCustomAttachments: [CustomAttachment],
        quotedMessage: Binding<ChatMessage?>,
        maxMessageLength: Int?,
        cooldownDuration: Int,
        onCustomAttachmentTap: @escaping (CustomAttachment) -> Void,
        shouldScroll: Bool,
        removeAttachmentWithId: @escaping (String) -> Void
    ) -> some View {
        ComposerInputView(input: text) { [unowned self] message in
            guard let channelId = channelId else {
                return
            }
            
            chatClient
                .channelController(for: channelId)
                .createNewMessage(text: message)
        }
    }
    
//    func makeLeadingComposerView(
//        state: Binding<PickerTypeState>,
//        channelConfig: ChannelConfig?) -> some View {
//            LeadingComposerView(pickerTypeState: state)
//        }
//    
//    func makeTrailingComposerView(
//        enabled: Bool,
//        cooldownDuration: Int,
//        onTap: @escaping () -> Void
//    ) -> some View {
//        EmptyView()
//    }
    
    func makeComposerViewModifier() -> some ViewModifier {
        BackgroundViewModifier()
    }
    struct BackgroundViewModifier: ViewModifier {
        public func body(content: Content) -> some View {
            content
                .background(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)))
        }
    }

    
    
    func makeLinkAttachmentView(
        for message: ChatMessage,
        isFirst: Bool,
        availableWidth: CGFloat,
        scrolledId: Binding<String?>
    ) -> some View {
        ZStack {
            if message.linkAttachments.isEmpty {
                Text("Link not available")
                    .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
            } else {
                AttachmentLinkView(linkAttachment: message.linkAttachments[0], width: availableWidth)
            }
        }
    }

}
