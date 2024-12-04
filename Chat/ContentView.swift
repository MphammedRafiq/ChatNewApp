//
//  ContentView.swift
//  Chat
//
//  Created by MohammedRafiq on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
      switch viewModel.state {
        case .signedIn: ChatListView()
        case .signedOut: LoginView()
      }
    }
  }

  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }


