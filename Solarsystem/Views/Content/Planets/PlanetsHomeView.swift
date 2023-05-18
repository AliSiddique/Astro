//
//  PlanetsHomeView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 17/05/2023.
//

import SwiftUI

struct PlanetsHomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Image10")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView(showsIndicators:false) {
                    VStack {
                        ForEach(planetItems) { planet in
                            NavigationLink(destination: PlanetSingleView(planet: planet)) {
                                HStack(alignment:.center) {
                                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Earth_from_Space.jpg/1200px-Earth_from_Space.jpg?20070814130228")) { image in
                                               image
                                                   .resizable()
                                                   .aspectRatio(contentMode: .fit)
                                           } placeholder: {
                                               ProgressView()
                                           }
                                           .mask(RoundedRectangle(cornerRadius: 40))
                                           .frame(width: 50, height: 50)
                                    
                                    Text(planet.name)
                                        .foregroundColor(.white)
                                }
                                .padding(20)
                                .background(.black.opacity(0.6))
                            .mask(RoundedRectangle(cornerRadius: 40))
                            }

                        }
                    }
                }
                .frame(maxWidth:.infinity)
                
            }
        }
        
    }
}

struct PlanetsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsHomeView()
    }
}
