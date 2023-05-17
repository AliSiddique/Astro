//
//  ProfileView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 12/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @State var checkedNot:Bool = false
    @State var showingSheet:Bool = false
    var body: some View {
        NavigationView {
            
            List {
                VStack {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .font(.system(size:32))
                        .foregroundStyle(.blue, .blue.opacity(0.4))
                        .padding(25)
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(Image(systemName: "hexagon.fill")
                            .font(.system(size:200))
                            .foregroundColor(.blue)
                            .offset(x:-50,y:-100)
                        )
                    Text("Ali Siddique")
                  
                }
                .frame(maxWidth:.infinity)
                Section {
                    Label("Ali", systemImage: "person")
                    Label("alisiddique10@hotmail.com ", systemImage: "envelope")

                }
                
                
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
                    .onTapGesture {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        SettingsView()
                    }
                }
                Section {
                    Label("Settings", systemImage: "gear")

                    NavigationLink {
                        Text("R a Review")
                    } label: {
                        Label("Share", systemImage: "ant")
                        
                    }
                    
                    
                
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
                    HStack {
                        Link(destination: URL(string:"https://alhas.me")!) {
                            Label("T&C", systemImage: "person.badge.key")
                        }
                        Spacer()
                        Image(systemName: "link")
                    }
                }
            }
            .navigationTitle("Profile")
            .background(Image("Image10"))
        }
    }
}
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }

