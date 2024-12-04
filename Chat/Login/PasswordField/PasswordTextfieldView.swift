//
//  PasswordTextfieldView.swift
//  Chat
//
//  Created by MohammedRafiq on 28/11/24.
//

import SwiftUI

enum Field: Hashable {
    case showPasswordField
    case hidePasswordField
}


struct PasswordTextfieldView: View {
    
    enum Opacity: Double {

        case hide = 0.0
        case show = 1.0

        /// Toggle the field opacity.
        mutating func toggle() {
            switch self {
            case .hide:
                self = .show
            case .show:
                self = .hide
            }
        }
    }

    /// The property wrapper type that can read and write a value that
    /// SwiftUI updates as the placement of focus.
    @FocusState private var focusedField: Field?

    /// The show / hide state of the text.
    @State private var isSecured: Bool = true

    /// The opacity of the SecureField.
    @State private var hidePasswordFieldOpacity = Opacity.show

    /// The opacity of the TextField.
    @State private var showPasswordFieldOpacity = Opacity.hide

    /// The text value of the SecureFiled and TextField which can be
    /// binded with the @State property of the parent view of SecuredTextFieldView.
    @Binding var text: String
    
    /// Parent view of this SecuredTextFieldView.
    /// Also this is a struct and structs are value type.
    @State var parent: SecuredTextFieldParentProtocol

    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                securedTextField

                Button(action: {
                    performToggle()
                }, label: {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor)))
                        .padding(.trailing, 10)
                })
            }
        }
        .onAppear {
            self.parent.hideKeyboard = hideKeyboard
        }
    }

    /// Secured field with the show / hide capability.
    var securedTextField: some View {
        Group {
            
            SecureField("Password", text: $text, prompt: Text("Enter your password").foregroundColor(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor))))
                .padding(10)
                .font(Font.custom(ConstantValues.FiraCodeRegular, size: 18))
                .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(25)
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.gray.opacity(1.0), lineWidth: 1)
                }
                .focused($focusedField, equals: .hidePasswordField)
                .opacity(hidePasswordFieldOpacity.rawValue)

            TextField("Password", text: $text, prompt: Text("Enter your password").foregroundColor(.gray.opacity(1.0)))
                .padding(10)
                .font(Font.custom(ConstantValues.FiraCodeRegular, size: 18))
                .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(25)
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.gray.opacity(1.0), lineWidth: 1)
                }
                .focused($focusedField, equals: .showPasswordField)
                .opacity(showPasswordFieldOpacity.rawValue)
        }
    }
    
    /// This supports the parent view to perform hide the keyboard.
    func hideKeyboard() {
        self.focusedField = nil
    }
    
    /// Perform the show / hide toggle by changing the properties.
    private func performToggle() {
        isSecured.toggle()

        if isSecured {
            focusedField = .hidePasswordField
        } else {
            focusedField = .showPasswordField
        }

        hidePasswordFieldOpacity.toggle()
        showPasswordFieldOpacity.toggle()
    }
}
