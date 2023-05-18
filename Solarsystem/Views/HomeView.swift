//
//  HomeView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 13/05/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            PlanetsHomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            Paywall()
                .tabItem {
                    VStack {
                        Image(systemName: "creditcard")
                        Text("Billing")
                    }
                }
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
