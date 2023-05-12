//
//  Signup.swift
//  Solarsystem
//
//  Created by Ali Siddique on 12/05/2023.
//

import SwiftUI

struct SignupView: View {
    @State var email:String = ""
    @State var password:String = ""
    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Passowrd", text: $password)
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
