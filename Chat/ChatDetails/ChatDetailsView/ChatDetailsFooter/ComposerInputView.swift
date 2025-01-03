//
//  ComposerInputView.swift
//  Chat
//
//  Created by MohammedRafiq on 02/12/24.
//

import SwiftUI

struct ComposerInputView: View {
    
    @Binding var input: String
    var send: (String) -> Void
    
    @State private var showNotImplementedAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
            TextField("", text: $input)
                .foregroundColor(.white)
                .overlay(alignment: .leading) {
                    if input.isEmpty {
                        Text("Send Message")
                            .font(Font.custom(ConstantValues.FiraCodeRegular, size: 16))
                            .foregroundStyle(Color(hexStringToUIColor(hex: ConstantValues.placeHolderGrayColor)))
                            .padding(.leading, 4)
                            .allowsHitTesting(false)
                    }
                }
            
            if !input.isEmpty {
                Button {
                    send(input)
                    
                    input = ""
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .font(.body.weight(.semibold))
                }
            } else {
                Button {
                    showNotImplementedAlert = true
                } label: {
                    Image(systemName: "waveform.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.secondary)
                }
                .alert("This is not yet implemented", isPresented: $showNotImplementedAlert) {
                    Button("OK", role: .cancel) {}
                }
            }
        }
        .padding(4)
        .overlay(Capsule()
            .stroke(.tertiary, lineWidth: 1)
            .opacity(0.7)
        )
        .padding(.trailing, 8)
        .background(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)))
    }
}

struct ComposerInputView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ComposerInputView(input: .constant("")) { message in
                print("Yes")
            }
            .padding()
            .previewLayout(.fixed(width: 360, height: 100.0))
            
            ComposerInputView(input: .constant("This is my message to you")) { message in
                print("Yes")
            }
            .padding()
            .previewLayout(.fixed(width: 360, height: 100.0))
            
            ComposerInputView(input: .constant("")) { message in
                print("Yes")
            }
            .padding()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 360, height: 100.0))
            
            ComposerInputView(input: .constant("This is my message to you")) { message in
                print("Yes")
            }
            .padding()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 360, height: 100.0))
        }
    }
}
