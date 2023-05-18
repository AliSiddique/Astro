//
//  PlanetSingleView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 17/05/2023.
//

import SwiftUI

struct PlanetSingleView: View {
    public var planet:Planet
    var body: some View {
        ZStack {
            Image("Image10")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing:15) {
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Earth_from_Space.jpg/1200px-Earth_from_Space.jpg?20070814130228")) { image in
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                       } placeholder: {
                           ProgressView()
                       }
                       .mask(RoundedRectangle(cornerRadius: 40))
                Text(planet.name)
                    .foregroundColor(.white)
                Text(planet.Descriptions)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                HStack {
                    Text("Diameter \(planet.diameter)")
                    Text("Gravity \(planet.gravity)")
                    Text("Moons \(planet.moons)")

                }
            }
            .padding()
            
        }
    }
}

struct PlanetSingleView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetSingleView(planet: planetItems[0])
    }
}
