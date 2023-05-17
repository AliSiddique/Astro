//
//  PlanetsHomeView.swift
//  Solarsystem
//
//  Created by Ali Siddique on 17/05/2023.
//

import SwiftUI

struct PlanetsHomeView: View {
    var body: some View {
        ZStack {
            Image("Image10")
                .resizable()
                .ignoresSafeArea()
            VStack {
                ForEach(planetItems) { planet in
                    Text(planet.name)
                        .foregroundColor(.white)
                }
            }
            
        }
        
    }
}

struct PlanetsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsHomeView()
    }
}
