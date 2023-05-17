//
//  SignInWithAppleButton.swift
//  Solarsystem
//
//  Created by Ali Siddique on 15/05/2023.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton:UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}
