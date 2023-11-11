//
//  Car.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/9/23.
//

import Foundation

struct Car: Codable {
    var id_car: String
    var name: String
    var team: Team
    var frame: String
    var engine: Engine
    var cylinder: Int
    var type: String
    var electronic: String
    var fuel: String
    var tyres: [Tyre]
    var wheels: String
    var weight: Int
    
    init() {
        self.id_car = "6541855dcd48b459dd5cdb1a"
        self.name = "RB21"
        self.team = Team(id_team: "65413e60bd7aee0959afdaf3", name: "Red Bull", completeName: "Oracle Red Bull Racing", nationality: Country(id_country: "6541050682c016d52426f920", name: "Autriche"), points: 254, points_sprint: 28)
        self.frame = "Monocoque composite moulée en fibre de carbone et nid d'abeilles"
        self.engine = Engine(name: "Honda RBPT", orientation: "Longitudinale", configuration: "V6 turbo ouvert à 90°, limité à 15 000 tr/min", position: "Centrale")
        self.cylinder = 1600
        self.type = "\n - Changement rapide\n - Différentiel à glissement limité semi-automatique séquentielle électronique seamless"
        self.electronic = "Allumage et injection électroniques"
        self.fuel = "Esso"
        self.tyres = [Tyre(name: "Pirelli PZero", type: "Sec"), Tyre(name: "Cinturato", type: "Humide")]
        self.wheels = "BBS"
        self.weight = 796
    }
    
    enum CodingKeys: String, CodingKey {
        case id_car = "_id"
        case name = "name"
        case team = "team"
        case frame = "frame"
        case engine = "engine"
        case cylinder = "cylinder"
        case type = "type"
        case electronic = "electronic"
        case fuel = "fuel"
        case tyres = "tyres"
        case wheels = "wheels"
        case weight = "weight"
    }
    
    struct Engine: Codable {
        var name: String
        var orientation: String
        var configuration: String
        var position: String
    }
    
    struct Tyre: Codable {
        var name: String
        var type: String
    }
}
