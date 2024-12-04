//
//  ChatDetailsHeaderView.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI

struct ChatDetailsHeaderView: ToolbarContent {
    
    @ObservedObject var viewModel: ChatDetailsHeaderViewModel
    @Binding var isInfoSheetShown: Bool
    @Binding var isVideoSheetShown: Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Button {
                isInfoSheetShown = true
            } label: {
                VStack(spacing: 4) {
                    Text(viewModel.channelName ?? "Unknown")
                        .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
                           // .font(.title3)
                            .foregroundColor(.white)
                     
                    if viewModel.connectionStatus! {
                        Text("Online")
                                //.font(.caption)
                                .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
                                .foregroundStyle(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor)))
                    } else {
                        Text("Offline")
                                .font(.caption)
                                .foregroundStyle(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor)))
                    }
                }
                .padding(.bottom, 6)
            }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            if let headerImage = viewModel.headerImage {
                Image(uiImage: headerImage)
                    .resizable()
                    .frame(width: 30, height: 30)
            } else {
                Circle()
                    .fill(.cyan)
                    .frame(width: 30, height: 30)
            }
        }
    }
}
