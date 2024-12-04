//
//  SearchView.swift
//  Chat
//
//  Created by MohammedRafiq on 04/12/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct SearchView: View {
    

 var body: some View {
     HStack(spacing: 5) {
         ZStack {
         }.frame(width: 100)
             .background(.gray)
         
     }
     .padding(.vertical, 10)
     .background(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor))
         .ignoresSafeArea())
     .frame(width: ConstantValues.deviceWidth + 18)
}
}


#Preview {
    SearchView()
}
