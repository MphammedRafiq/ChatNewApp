//
//  CustomChannelHeader.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI
import StreamChatSwiftUI
import GoogleSignIn

public struct CustomChannelHeader: ToolbarContent {

    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    // 2
    private let user = GIDSignIn.sharedInstance.currentUser
    
    @Injected(\.fonts) var fonts
    @Injected(\.images) var images

    public var title: String
    public var onTapLeading: () -> ()

    public var body: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            NavigationLink {
                Text("This is injected view")
            } label: {
                Spacer()
                AsyncImage(url: URL(string: "https://hws.dev/paul3.jpg")) { phase in
                            switch phase {
                            case .failure:
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                            case .success(let image):
                                image
                                    .resizable()
                            default:
                                ProgressView()
                            }
                        }
                        .frame(width: 30, height: 30)
                        .clipShape(.rect(cornerRadius: 25))
//                Image(systemName: "")
//                    .resizable()
//                    .background(.white)
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 30, height: 30)
//                    .clipShape(Circle())
            }
        }
        ToolbarItem(placement: .principal) {
           Text("Connections")
                .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
                .foregroundColor(.white)

        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                onTapLeading()
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                viewModel.signOut()
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        
    }
}
