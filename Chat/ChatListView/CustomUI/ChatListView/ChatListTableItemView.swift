//
//  ChatListTableItemView.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI

struct ChatListTableItemView: View {
    let channelName: String
    let avatar: UIImage
    let lastMessageAt: Date
    let hasUnreadMessages: Bool
    let lastMessage: String
    let isMuted: Bool
    let isStatusOnline: Bool
    
    var lastMessageStamp: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: lastMessageAt)
    }
    
    var body: some View {
        HStack(spacing: 5) {
            ZStack {
                if hasUnreadMessages {
                    Circle()
                        .foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)))
                }
            }
            .frame(width: 12)
        
            Spacer()
            
            clientImage(clientImageDetails: avatar, status: isStatusOnline)
            
            Spacer()
            
            clientDetails(name: channelName,  lastMessage: lastMessage, lastMessageStamp: lastMessageStamp)
            
        }
        .padding(.vertical, 10)
        .background(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor))
            .ignoresSafeArea())
        .frame(width: ConstantValues.deviceWidth + 18)
    }
}


struct clientImage: View {

    var avatar: UIImage
    var statusOnline: Bool

    init(clientImageDetails: UIImage, status: Bool) {
        self.avatar = clientImageDetails
        self.statusOnline = status
    }

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(uiImage: avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            if (statusOnline) {
            VStack
            {
                HStack {
                    
                    Image("greenButton")
                        .resizable()
                        .background(.green)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 14, height: 14)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)), lineWidth: 2)
                        )
                    
                    Spacer()
                    
                }
                Spacer()
            }
            .padding(.horizontal, 38)
        }
        }
        .frame(width: 40, alignment: .leading)
    }
}


struct clientDetails: View {
    var channelName: String = ""
    var channelLastMessage: String = ""
    var channelLastMessageStamp: String = ""
    
    init(name: String, lastMessage: String, lastMessageStamp: String) {
        self.channelName = name
        self.channelLastMessage = lastMessage
        self.channelLastMessageStamp = lastMessageStamp
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(channelName)
                    .font(Font.custom(ConstantValues.FiraCodeBold, size: 18))
                    .foregroundColor(.white)
                    .lineLimit(1)
                Spacer()
            }
            
            HStack(alignment: .top, spacing: 5) {
                Text(channelLastMessage)
                    .foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.appGrayColor)))
                    .font(Font.custom(ConstantValues.FiraCodeRegular, size: 14))
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
                Spacer()
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 5)
                    .foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.checkGrayColor)))
                    .frame(maxWidth: 10, minHeight: 10)
                HStack(spacing: 10) {
                    Text(channelLastMessageStamp)
                        .font(Font.custom(ConstantValues.FiraCodeRegular, size: 14))
                        .foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.appGrayColor)))
                    
                }
                .font(.subheadline)
                
                Spacer()
            }
        }
    }
}


struct ChatListTableItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatListTableItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: true, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: false, isStatusOnline: false)
                .previewLayout(.fixed(width: 400, height: 120))
                .padding()
            ChatListTableItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: true, lastMessage: "New", isMuted: true, isStatusOnline: true)
                .previewLayout(.fixed(width: 400, height: 120))
                .padding()
            
            ChatListTableItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: false, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: true, isStatusOnline: true)
                .previewLayout(.fixed(width: 400, height: 120))
                .padding()
            
            ChatListTableItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: true, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: false, isStatusOnline: false)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 400, height: 120))
                .padding()
            
            ChatListTableItemView(channelName: "Preview Channel", avatar: UIImage(named: "oval")!, lastMessageAt: Date(), hasUnreadMessages: false, lastMessage: "We have a lot of great ideas to bring forward the SDK in the future and it's going to be great!", isMuted: true, isStatusOnline: true)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 400, height: 120))
                .padding()
        }
    }
}
