//
//  ChatApp.swift
//  Chat
//
//  Created by MohammedRafiq on 27/11/24.
//

import SwiftUI
import Firebase
import GoogleSignIn
import StreamChat
import StreamChatSwiftUI


@main
struct ChatApp: App {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    @State var streamChat: StreamChat?
    
    init() {
        setupAuthentication()
        streamChat = StreamChat(chatClient: chatClient)
        connectUser()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

extension ChatApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}


var chatClient: ChatClient = {
    //For the tutorial we use a hard coded api key and application group identifier
    var config = ChatClientConfig(apiKey: .init("8br4watad788"))
    config.isLocalStorageEnabled = true
    config.applicationGroupIdentifier = "group.io.getstream.iOS.ChatDemoAppSwiftUI"

    // The resulting config is passed into a new `ChatClient` instance.
    let client = ChatClient(config: config)
    return client
}()


private func connectUser() {
    // This is a hardcoded token valid on Stream's tutorial environment.
    let token = try! Token(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.kFSLHRB5X62t0Zlc7nwczWUfsQMwfkpylC6jCUZ6Mc0")
        
    // Call `connectUser` on our SDK to get started.
    chatClient.connectUser(
        userInfo: .init(
            id: "luke_skywalker",
            name: "Luke Skywalker",
            imageURL: URL(string: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg")!
        ),
        token: token
    ) { error in
        if let error = error {
            // Some very basic error handling only logging the error.
            log.error("connecting the user failed \(error)")
            return
        }
    }
}

