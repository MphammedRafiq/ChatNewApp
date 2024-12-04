//
//  LoginVM.swift
//  Chat
//
//  Created by MohammedRafiq on 28/11/24.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    
    enum SignInState {
      case signedIn
      case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    func signIn() {
      // 1
      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
          authenticateUser(for: user, with: error)
        }
      } else {
        // 2
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // 3
        let configuration = GIDConfiguration(clientID: clientID)
        
        // 4
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
          GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
              
              if let error = error {
                print(error.localizedDescription)
                return
              }
           
              GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
                              authenticateUser(for: result?.user, with: error)
                          }
              
           
            }
        // 5
//        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
//          authenticateUser(for: user, with: error)
//        }
      }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
      // 1
      if let error = error {
        print(error.localizedDescription)
        return
      }
        
        guard let user = user,
                                      let idToken = user.idToken else { return }
        
        let accessToken = user.accessToken
                                    
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

        // 3
        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
          if let error = error {
            print(error.localizedDescription)
          } else {
            state = .signedIn
          }
        }
    }
    
    func signOut() {
      // 1
      GIDSignIn.sharedInstance.signOut()
      
      do {
        // 2
        try Auth.auth().signOut()
        
        state = .signedOut
      } catch {
        print(error.localizedDescription)
      }
    }
  }
