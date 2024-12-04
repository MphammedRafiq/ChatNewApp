//
//  BackgroundView.swift
//  Chat
//
//  Created by MohammedRafiq on 01/12/24.
//

//import Foundation

import SwiftUI

struct BackgroundView: View {
   
    var body: some View {
        Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor))
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
