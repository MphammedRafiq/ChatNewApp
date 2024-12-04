//
//  SecuredTextFieldParentProtocol.swift
//  Chat
//
//  Created by MohammedRafiq on 28/11/24.
//

import Foundation

protocol SecuredTextFieldParentProtocol {
    
    /// Assign SecuredTextFieldView hideKeyboard method to this and
    /// then parent can excute it when needed..
    var hideKeyboard: (() -> Void)? { get set }
}
