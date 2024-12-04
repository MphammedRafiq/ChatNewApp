//
//  ChatDetailsHeaderModifier.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct ChatDetailsHeaderModifier: ChatChannelHeaderViewModifier {
    var channel: ChatChannel
    
    @State private var infoScreenShown = false
    @State private var videoScreenShown = false
    
    func body(content: Content) -> some View {
            content.toolbar {
                ChatDetailsHeaderView(
                    viewModel: ChatDetailsHeaderViewModel(channel: channel),
                    isInfoSheetShown: $infoScreenShown,
                    isVideoSheetShown: $videoScreenShown)
            }
            .toolbarBackground((Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor))), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(isPresented: $infoScreenShown) {
                ChatChannelInfoView(channel: channel)
            }
            .sheet(isPresented: $videoScreenShown) {
                Text("Video not implemented yet.")
                    .font(Font.custom(ConstantValues.FiraCodeRegular, size: 20))
            }
            
    }
}
