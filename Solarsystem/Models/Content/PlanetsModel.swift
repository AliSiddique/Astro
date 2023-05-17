//
//  PlanetsModel.swift
//  Solarsystem
//
//  Created by Ali Siddique on 17/05/2023.
//

import Foundation
import SwiftUI
struct Planet:Identifiable {
    var id = UUID()
    let name: String
    let diameter: Double // in kilometers
    let mass: Double // in kilograms
    let gravity: Double // in m/s^2
    let distanceFromSun: Double // in millions of kilometers
    let orbitalPeriod: Double // in Earth days
    let moons: Int
    let hasRings: Bool
    var Descriptions:String
    var image:String
}

var planetItems = [
    Planet(
        name: "Mercury",
        diameter: 4879,
        mass: 3.3011e23,
        gravity: 3.7,
        distanceFromSun: 57.9,
        orbitalPeriod: 88,
        moons: 0,
        hasRings: false,
        Descriptions: "Mercury is the smallest planet in our solar system and closest to the Sun. It has a rocky surface and no atmosphere.",
        image: "mercury.jpg"
    ),
    Planet(
        name: "Venus",
        diameter: 12104,
        mass: 4.8675e24,
        gravity: 8.87,
        distanceFromSun: 108.2,
        orbitalPeriod: 225,
        moons: 0,
        hasRings: false,
        Descriptions: "Venus is the second planet from the Sun and is known for its extremely hot and dense atmosphere.",
        image: "venus.jpg"
    ),
    Planet(
        name: "Earth",
        diameter: 12756,
        mass: 5.97237e24,
        gravity: 9.81,
        distanceFromSun: 149.6,
        orbitalPeriod: 365.25,
        moons: 1,
        hasRings: false,
        Descriptions: "Earth is our home planet and the only known celestial body to support life. It has a diverse ecosystem and abundant water.",
        image: "earth.jpg"
    ),
    Planet(
        name: "Mars",
        diameter: 6792,
        mass: 6.4171e23,
        gravity: 3.71,
        distanceFromSun: 227.9,
        orbitalPeriod: 687,
        moons: 2,
        hasRings: false,
        Descriptions: "Mars is often called the Red Planet due to its reddish appearance. It has a thin atmosphere and polar ice caps.",
        image: "mars.jpg"
    ),
    Planet(
        name: "Jupiter",
        diameter: 139820,
        mass: 1.8982e27,
        gravity: 24.79,
        distanceFromSun: 778.3,
        orbitalPeriod: 4332.59,
        moons: 79,
        hasRings: true,
        Descriptions: "Jupiter is the largest planet in our solar system and has a strong magnetic field. It is known for its iconic Great Red Spot.",
        image: "jupiter.jpg"
    ),
    Planet(
        name: "Saturn",
        diameter: 116460,
        mass: 5.6834e26,
        gravity: 10.44,
        distanceFromSun: 1427,
        orbitalPeriod: 10759.22,
        moons: 82,
        hasRings: true,
        Descriptions: "Saturn is famous for its stunning ring system composed of ice particles and rocky debris. It has numerous moons.",
        image: "saturn.jpg"
    ),
    Planet(
        name: "Uranus",
        diameter: 50724,
        mass: 8.6810e25,
        gravity: 8.87,
        distanceFromSun: 2871,
        orbitalPeriod: 30688.5,
        moons: 27,
        hasRings: true,
        Descriptions: "Uranus is the seventh planet from the Sun and is characterized by its unique feature of rotating on its side. It has a pale blue color and a composition of mainly hydrogen and helium.",
        image: "uranus.jpg"
    ),
    Planet(
        name: "Neptune",
        diameter: 49244,
        mass: 1.02413e26,
        gravity: 11.15,
        distanceFromSun: 4497,
        orbitalPeriod: 60182,
        moons: 14,
        hasRings: true,
        Descriptions: "Neptune is the farthest planet from the Sun and is known for its vibrant blue color. It has strong winds and a dynamic atmosphere.",
        image: "neptune.jpg"
    )
]

