//
//  MoonViewModel.swift
//  Solarsystem
//
//  Created by Ali Siddique on 19/05/2023.
//

import Foundation
import Firebase

final class MoonViewModel: ObservableObject {
    @Published var planetName: String = ""
    @Published var moons: [Moon] = []
//    init() {
//        fetchMoons(name: self.planetName)
//    }
    func fetchMoons(name:String) {
        let db = Firestore.firestore()
        db.collection("moons").whereField("forPlanet", isEqualTo: name).getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        let data = document.data()
                        let id = data["id"] as? String ?? ""
                        let name = data["name"] as? String ?? ""
                        let diameter = data["diameter"] as? Double ?? 20
                        let mass = data["mass"] as? Double ?? 10
                        let orbitalPeriod = data["orbitalPeriod"] as? Double ?? 1
                        let surfaceTemperature = data["surfaceTemperature"] as? Double ?? 20
                        let distanceFromPlanet = data["distanceFromPlanet"] as? Double ?? 94
                        let composition = data["composition"] as? String ?? ""
                        let atmosphere = data["atmosphere"] as? String ?? ""
                        let rotationPeriod = data["rotationPeriod"] as? Double ?? 3.4
                        let surfaceGravity = data["surfaceGravity"] as? Double ?? 9.8
                        let magneticField = data["magneticField"] as? Bool ?? false


                        let moon = Moon(id:id,name: name, diameter: diameter, mass: mass, orbitalPeriod: orbitalPeriod, surfaceTemperature: surfaceTemperature, distanceFromPlanet: distanceFromPlanet, composition: composition, atmosphere: atmosphere, rotationPeriod: rotationPeriod, surfaceGravity: surfaceGravity, magneticField: magneticField)
                        self.moons.append(moon)
                        print(data)
                    }
                }
            }
        }
    }
}

