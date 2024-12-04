//
//  LoginView.swift
//  Chat
//
//  Created by MohammedRafiq on 29/11/24.
//

import SwiftUI

struct LoginView: View, SecuredTextFieldParentProtocol {

    var hideKeyboard: (() -> Void)?
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var userName: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @FocusState private var focused: focusedField?
    
    
    var isSignInButtonDisabled: Bool {
        [userName, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        ZStack {
        
            Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor))
                .ignoresSafeArea(.all)
            VStack() {
                
                appLogo
            
                VStack(alignment: .leading) {
                                
                    loginText
                    loginSubHeader
                    emailText

                    TextField("Username", text: $userName,
                              prompt: Text("Enter your email").foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor))))
                        .padding(10)
                        .font(Font.custom(ConstantValues.FiraCodeRegular, size: 18))
                        .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(25)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.gray.opacity(1.0), lineWidth: 1)
                        }
                        .padding(.trailing, 15)
                        .padding(.bottom, 20)
                    
                    passwordText
                   
                    
                        VStack {
                            Group {
                                VStack {
                                    PasswordTextfieldView(text: $password, parent: self)
                                        .padding(.trailing, 15)
                                }
                            }
                    }

                    forgotPasswordButton
                    loginButton
                    loginWithText
                    googleSignInButton(googleModel: viewModel)
                    registerButton
                    
                }
                .padding(.leading, 20)
                
            }
        }
        
    }
    enum focusedField {
            case secure, unSecure
        }

}

var appLogo: some View {
    Image(.loginLogo)
        .resizable()
        .scaledToFit()
        .frame(width: 150, height: 150)
        .overlay(
                           RoundedRectangle(cornerRadius: 75)
                            .stroke(Color(hexStringToUIColor(hex: ConstantValues.radiumAppColor)), lineWidth: 1)
                       )
    }

var loginText: some View {
    Text("Login")
        .font(Font.custom(ConstantValues.FiraCodeMedium, size: 30))
        .foregroundStyle(.white)
        .padding(.bottom, 10)
    }

var loginSubHeader: some View {
    Text("Login in to continue using the app")
          .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
          .foregroundStyle(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor)))
          .padding(.bottom, 20)
    }

var emailText: some View {
    Text("Email")
         .font(Font.custom(ConstantValues.FiraCodeMedium, size: 20))
        .foregroundStyle(.white)
        .padding(.bottom, 5)
    }

var passwordText: some View {
    Text("Password")
         .font(Font.custom(ConstantValues.FiraCodeMedium, size: 18))
        .foregroundStyle(.white)
        .padding(.bottom, 5)
    }

var forgotPasswordButton: some View {
    Button {
        print("do forgot action")
    } label: {
        Text("Forgot Password?")
            .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
            .foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor)))
    }
    .frame(height: 30)
    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
    .padding(.trailing, 20)
    .padding(.bottom, 5)
    }

var loginButton: some View {
    Button {
        print("do login action")
    } label: {
        Text("Login")
            .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
            .foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)))
    }
    .frame(height: 50)
    .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
    .background(Color(hexStringToUIColor(hex: ConstantValues.radiumAppColor)))
    .cornerRadius(25)
    .padding(.trailing, 20)
}

var loginWithText: some View {
    Text("\(Text("--------").coloredText(Color(hexStringToUIColor(hex: ConstantValues.appGrayColor)))) \(Text("Or Login with").coloredText(.white)) \(Text("--------").coloredText(Color(hexStringToUIColor(hex: ConstantValues.appGrayColor))))")
        .padding(20)
        .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
        .foregroundStyle(.gray)
        .frame(maxWidth: .infinity, alignment: .center)
    }

struct googleSignInButton: View {

    var googleViewModel: AuthenticationViewModel

    init(googleModel: AuthenticationViewModel) {
        self.googleViewModel = googleModel
    }

    var body: some View {

                Button {
                        googleViewModel.signIn()
                    } label: {
                        Image("google")
                            .scaledToFit()
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(.trailing, 20)
        }
    }


var registerButton: some View {
    Button {
        print("do register action")
    } label: {
        Text("\(Text("Don't have an account?").coloredText(.white)) \(Text("Register").foregroundStyle(Color(hexStringToUIColor(hex: ConstantValues.radiumAppColor))))")
            .padding(20)
            .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    }



struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}

