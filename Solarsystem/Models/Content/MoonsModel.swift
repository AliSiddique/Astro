//
//  MoonsModel.swift
//  Solarsystem
//
//  Created by Ali Siddique on 18/05/2023.
//

import SwiftUI


struct Moon: Identifiable {
    let id = UUID()
    let name: String
    let diameter: Double // in kilometers
    let mass: Double // in kilograms
    let orbitalPeriod: Double // in Earth days
    let distanceFromPlanet: Double // in kilometers
    let hasAtmosphere: Bool
    let image: String
}

struct PlanetMoon : Identifiable {
    var id = UUID()
    let name: String
    let diameter: Double // in kilometers
    let mass: Double // in kilograms
    let orbitalPeriod: Double // in Earth days
    let distanceFromSun: Double // in millions of kilometers
    let hasRings: Bool
    let moons: [Moon]
    let image: String
}
