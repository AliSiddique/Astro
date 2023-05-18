//
//  CometsModel.swift
//  Solarsystem
//
//  Created by Ali Siddique on 18/05/2023.
//

import SwiftUI

struct Comet: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let description: String
}
let comets = [
    Comet(name: "Halley's Comet", type: "Short-period", description: "One of the most famous comets with a periodic orbit of approximately 76 years."),
    Comet(name: "Comet Hale-Bopp", type: "Long-period", description: "A widely observed comet that became visible to the naked eye in 1997."),
    Comet(name: "Comet Encke", type: "Short-period", description: "A comet with an orbital period of about 3.3 years."),
    Comet(name: "Comet Lovejoy", type: "Long-period", description: "A bright comet that displayed a distinct green color in 2011."),
    Comet(name: "Kreutz sungrazers", type: "Sungrazing", description: "A group of comets that approach very close to the Sun, often disintegrating due to heat and gravitational forces."),
    Comet(name: "Jupiter-family Comets", type: "Jupiter-family", description: "Comets that have short orbital periods influenced by the gravity of Jupiter."),
    Comet(name: "Damocloid Comets", type: "Damocloid", description: "Comets with highly elongated and eccentric orbits, resembling asteroids."),
    Comet(name: "Extinct Comets", type: "Extinct", description: "Comets that have lost most or all of their volatile materials and no longer display a visible coma or tail."),
    Comet(name: "Centaur Comets", type: "Centaur", description: "Objects that exhibit characteristics of both comets and asteroids, with orbits crossing the paths of the outer planets."),
    // Add more comets here...
]
