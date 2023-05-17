//
//  SettingsView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 12/05/2023.
//

import SwiftUI
import UIKit
import FirebaseAuth
struct SettingsView: View {
    @State var checked:Bool = false
    @State var hapticChecked:Bool = false
    @State var loggedOut:Bool = false

    @State private var showAlert = false

    var body: some View {
        NavigationView {
            
            List {
                           Section {
                    HStack(spacing:20) {
                        Image("Earth")
                            .mask(RoundedRectangle(cornerRadius: 20))
                        VStack(alignment:.leading,spacing:10) {
                            Text("Get Pro")
                                .fontWeight(.bold)
                            Text("Unlimited updates,chart and more")
                        }
                    }
              
                }
                Section {
                    NavigationLink {
                        Text("Settings")
                    } label: {
                        Label("Settings", systemImage: "info.circle")
                        
                    }
                    
                    NavigationLink {
                        Text("Settings")
                    } label: {
                        Label("Write a review", systemImage: "star")
                        
                    }
                    Label("Help", systemImage: "questionmark")

                }
                Section {
             
                    
                    Toggle(isOn: $checked) {
                        Label("Notifications", systemImage: "bell.square.fill")
                    }
                    .onChange(of: checked) { newValue in
                                  handleToggle(newValue)
                              }
                    Toggle(isOn: $hapticChecked) {
                        Label("Haptic Feedback", systemImage: "questionmark")
                    }
                    .onChange(of: checked) { newValue in
                                  handleToggle(newValue)
                              }
                }
                Section {

                    NavigationLink {
                        Text("R a Review")
                    } label: {
                        Label("Report a Bug", systemImage: "ant")
                        
                    }
                    
                    
                    
                    Label("Help", systemImage: "questionmark")
                    
                }
                Section {
                    HStack {
                        Link(destination: URL(string:"https://alhas.me")!) {
                            Label("Website", systemImage: "house")
                        }
                        Spacer()
                        Image(systemName: "link")
                    }
                    HStack {
                        Link(destination: URL(string:"https://alhas.me")!) {
                            Label("Privacy", systemImage: "person.badge.key")
                        }
                        Spacer()
                        Image(systemName: "link")
                    }
                }
                Section {
                    Button {
                        logout()
                    } label: {
                        Label("Logout", systemImage: "rectangle.portrait.and.arrow.forward")
                            .foregroundColor(.red)
                    }

                }
                Section {
                    Button {
                       showAlert = true
                    } label: {
                       Label("Delete Account", systemImage: "trash")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    }
                    .alert(isPresented: $showAlert) {
                             Alert(
                                 title: Text("Are you sure you want to delete your account?"),
                                 primaryButton: .default(Text("No")),
                                 secondaryButton: .destructive(Text("Yes"))
                             )
                         }

                }
                
            }
            .navigationTitle("Settings")
            
            .background(Image("Image10"))
        }
    }
    private func handleToggle(_ value: Bool) {
         // Perform any logic based on the toggle value
         
         // Provide haptic feedback
        let generator = UIImpactFeedbackGenerator(style: .heavy)
         generator.impactOccurred()
     }
    func logout() {
        do {
            try Auth.auth().signOut()
            print("logged out")
        } catch {
            print("Error logging out: \(error.localizedDescription)")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
