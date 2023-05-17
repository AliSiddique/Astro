//
//  Login.swift
//  Solarsystem
//
//  Created by Ali Siddique on 12/05/2023.
//

import SwiftUI
import FirebaseAuth
struct Login: View {
    @State var email:String = ""
    @State var password:String = ""
    @State private var showHome = false

    @State private var signInWithAppleObject = SignInWithAppleObject()
    var body: some View {
        NavigationView {
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
                    Spacer()
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
                        login()
                    }
                    .frame(width:350)
                    .font(.system(.title))
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .cornerRadius(20)
                    Spacer()
                    Text("or sign in with")
                        .foregroundColor(.white)
                    Button {
                        signInWithAppleObject.signInWithApple()
                    } label: {
                        SignInWithAppleButton()
                    }
                    .frame(width:350,height:50)
                    .font(.system(.title))
       
                    Text("Have an account? Signup")
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .onAppear {
                Auth.auth().addStateDidChangeListener {
                    auth,user in
                    if user != nil {
                        showHome.toggle()
                               
                    }
                }
               
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .fullScreenCover(isPresented: $showHome) {
            HomeView()
        }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
