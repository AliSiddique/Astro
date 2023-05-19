//
//  MoonsModel.swift
//  Solarsystem
//
//  Created by Ali Siddique on 18/05/2023.
//

import SwiftUI


struct Moon:Identifiable {
    var id:String
    let name: String
    let diameter: Double
    let mass: Double
    let orbitalPeriod: Double
    let surfaceTemperature: Double
    let distanceFromPlanet: Double
    let composition: String
    let atmosphere: String?
    let rotationPeriod: Double
    let surfaceGravity: Double
    let magneticField: Bool
}
