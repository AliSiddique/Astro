//
//  MoonSingleView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 19/05/2023.
//

import SwiftUI

struct MoonSingleView: View {
    public var planet: Planet
    @StateObject var moonsVM = MoonViewModel()
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            Image("Image10")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    if isLoading {
                        VStack {
                            Text("Loading...")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                        }
                        .redacted(reason: .placeholder)
                    } else {
                        ForEach(moonsVM.moons, id: \.id) { moon in
                            HStack {
                                VStack(alignment: .leading, spacing: 7) {
                                    Text(moon.name)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(height: 48)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                    Text("Something something something")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .frame(height: 48)
                                }
                            }
                            .padding(10)
                            .background(.black.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .padding(10)
                        }
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            fetchMoons()
        }
    }
    
    private func fetchMoons() {
        moonsVM.fetchMoons(name: planet.name)
        isLoading = false
    }
}


struct MoonSingleView_Previews: PreviewProvider {
    static var previews: some View {
        MoonSingleView(planet: planetItems[0])
    }
}
