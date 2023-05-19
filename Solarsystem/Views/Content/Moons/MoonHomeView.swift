//
//  MoonHomeView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 17/05/2023.
//

import SwiftUI

struct MoonHomeView: View {
    var body: some View {
        NavigationView {
            ZStack  {
                Image("Image10")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    ForEach(planetItems) { planet in
                        NavigationLink(destination: MoonSingleView(planet: planet)) {
                            HStack {
                                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Earth_from_Space.jpg/1200px-Earth_from_Space.jpg?20070814130228")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .mask(RoundedRectangle(cornerRadius: 30))
                                } placeholder: {
                                    ProgressView()
                                }
                                VStack {
                                    Text(planet.name)
                                        .foregroundColor(.white)
                                    Text("\(planet.moons) moons")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        }


                    }
                }
            }
        }
    }
}

struct MoonHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MoonHomeView()
    }
}
