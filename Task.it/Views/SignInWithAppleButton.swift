//
//  SignInWithAppleButton.swift
//  Task.it
//
//  Created by Christelle Nieves on 8/31/20.
//  Copyright © 2020 Christelle Nieves. All rights reserved.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
