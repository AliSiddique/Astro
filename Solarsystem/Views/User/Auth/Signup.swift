//
//  Signup.swift
//  Solarsystem
//
//  Created by Ali Siddique on 12/05/2023.
//

import SwiftUI
import FirebaseAuth
struct SignupView: View {
    @State var email:String = ""
    @State var password:String = ""
    var body: some View {
        ZStack {
            Image("Image10")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Astro")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                    .frame(alignment: .top)

                VStack {
                    TextField("Email", text: $email)
                        .padding(13)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.black)
                        )
                        .padding()
                        .frame(width:400)
                        
                    SecureField("Password", text: $password)
                        .padding(13)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.black)
                        )
                        .padding()
                        .frame(width:400)
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: 300) // Set desired width

                Button("Sign up") {
                    signup()
                }
                .frame(width:350)
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .cornerRadius(20)
                
                Text("or sign in with")
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func signup(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            print("user signed up")
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
