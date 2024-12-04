//
//  ChannelListHeaderViewModifier.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//


import SwiftUI
import StreamChatSwiftUI

struct CustomChannelModifier: ChannelListHeaderViewModifier {

    var title: String

    @State var profileShown = false

    func body(content: Content) -> some View {
        content.toolbar {
            CustomChannelHeader(title: title) {
                profileShown = true
            }
        }
        .sheet(isPresented: $profileShown) {
            Text("Profile View")
        }
        .background(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor))
            .ignoresSafeArea())
    }

}
