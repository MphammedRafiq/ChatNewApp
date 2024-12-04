//
//  ChatMessageView.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI

struct ChatMessageView: View {
    
    var message: String
    var isCurrentUser: Bool
    var isFirst: Bool
    
    var body: some View {
        Text(message)
            .foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)))
            .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(hexStringToUIColor(hex: ConstantValues.radiumAppColor)),
                        in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .background(alignment: isCurrentUser ? .bottomTrailing : .bottomLeading) {
                isFirst
                ?
                Image(isCurrentUser ? "outgoingTail" : "incomingTail")
                    .renderingMode(.template)
                    .foregroundStyle(isCurrentUser ? Color(hexStringToUIColor(hex: ConstantValues.radiumAppColor)) : Color(hexStringToUIColor(hex: ConstantValues.radiumAppColor)))
                : nil
            }
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(message: "This is a test message", isCurrentUser: false, isFirst: true)
            .previewLayout(.fixed(width: 400, height: 140))
        ChatMessageView(message: "Can we already say how long their space will take? (Not in it anymore)", isCurrentUser: true, isFirst: true)
            .previewLayout(.fixed(width: 400, height: 140))
        ChatMessageView(message: "This is a test message", isCurrentUser: false, isFirst: true)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 140))
        ChatMessageView(message: "This is a test message", isCurrentUser: true, isFirst: true)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 400, height: 140))
    }
}
