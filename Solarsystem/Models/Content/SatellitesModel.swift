//
//  SatellitesModel.swift
//  Solarsystem
//
//  Created by Ali Siddique on 18/05/2023.
//
import SwiftUI
struct Satellite: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
}

let satellites = [
    Satellite(
        name: "Communication Satellites",
        description: "Satellites used for long-distance communication and telecommunications.",
        image: "communication_satellite"
    ),
    Satellite(
        name: "Weather Satellites",
        description: "Satellites designed to monitor and study Earth's weather patterns and climate.",
        image: "weather_satellite"
    ),
    Satellite(
        name: "Navigation Satellites",
        description: "Satellites used for global positioning and navigation systems.",
        image: "navigation_satellite"
    ),
    Satellite(
        name: "Earth Observation Satellites",
        description: "Satellites used to observe and monitor Earth's surface and environment.",
        image: "earth_observation_satellite"
    ),
    Satellite(
        name: "Scientific Satellites",
        description: "Satellites designed for scientific research and experiments in space.",
        image: "scientific_satellite"
    ),
    Satellite(
        name: "Military Satellites",
        description: "Satellites used for defense and national security purposes.",
        image: "military_satellite"
    ),
    Satellite(
        name: "Spy Satellites",
        description: "Satellites used for covert surveillance and gathering classified information.",
        image: "spy_satellite"
    ),
    Satellite(
        name: "Space Telescopes",
        description: "Satellites equipped with telescopic instruments to observe celestial objects.",
        image: "space_telescope"
    ),
    Satellite(
        name: "CubeSats",
        description: "Small satellites used for educational, scientific, or technology demonstration purposes.",
        image: "cubesat"
    )
]
