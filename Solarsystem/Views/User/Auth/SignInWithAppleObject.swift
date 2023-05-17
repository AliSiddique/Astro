//
//  SignInWithAppleObject.swift
//  Solarsystem
//
//  Created by Ali Siddique on 15/05/2023.
//

import Foundation
import CryptoKit
import FirebaseAuth
import AuthenticationServices

public class SignInWithAppleObject : NSObject {
    private var currentNonce:String?
    func signInWithApple(){
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.email,.fullName]
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(currentNonce!)
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    func sha256(_ input: String) -> String {
          let inputData = Data(input.utf8)
          let hashedData = SHA256.hash(data: inputData)
          let hashString = hashedData.compactMap {
          return String(format: "%02x", $0)
          }.joined()

          return hashString
      }
}

extension SignInWithAppleObject :ASAuthorizationControllerDelegate {
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                print("iNvalid")
                return
            }
            guard let appleIdToken = appleIdCredential.identityToken else {
                print("inable to fetch")
                return
            }
            guard let idTokenString = String(data: appleIdToken, encoding: .utf8) else {
                print("unabel to serialize")
                return
            }
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            Auth.auth().signIn(with: credential){
                result,error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
            }
        }
    }
}
