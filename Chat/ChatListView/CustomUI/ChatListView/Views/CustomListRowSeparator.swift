//
//  CustomListRowSeparator.swift
//  Chat
//
//  Created by MohammedRafiq on 01/12/24.
//

import SwiftUI

struct CustomListRowSeparator: View {
    var body: some View {
        Rectangle()
            .fill(Color(hexStringToUIColor(hex: ConstantValues.blackBackGroundColor)))
            .frame(width: ConstantValues.deviceWidth - 10, height: 1)
            .blendMode(.screen)
    }
}

struct CustomListRowSeparator_Previews: PreviewProvider {
    static var previews: some View {
        CustomListRowSeparator()
    }
}
