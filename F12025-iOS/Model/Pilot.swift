//
//  Pilote.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/13/23.
//

import Foundation

struct Pilot: Codable {
    var id_pilot: String
    var num_pilot: Int
    var name: String
    var dateBirth: String
    var placeBirth: String
    var countryBirth: Country
    var nationality: Country
    var team: Team
    var points: Int
    var points_sprint: Int
    var nb_bestLap: Int
    
    init() {
        self.id_pilot = "65415237e18361ef1f58bf97"
        self.num_pilot = 31
        self.name = "Esteban Ocon"
        self.dateBirth = "1996-09-16T22:00:00.000Z"
        self.placeBirth = "Évreux"
        self.countryBirth = Country(id_country: "6541050682c016d52426f93b", name: "France")
        self.nationality = Country(id_country: "6541050682c016d52426f93b", name: "France")
        self.team = Team(id_team: "65413e60bd7aee0959afdaf7", name: "Mercedes", completeName: "Mercedes-AMG Petronas F1 Team", nationality: Country(id_country: "6541050582c016d52426f914", name: "Allemagne"), points: 250, points_sprint: 37)
        self.points = 135
        self.points_sprint = 20
        self.nb_bestLap = 2
    }
    
    enum CodingKeys: String, CodingKey {
        case id_pilot = "_id"
        case num_pilot = "num_pilot"
        case name = "name"
        case dateBirth = "dateBirth"
        case placeBirth = "placeBirth"
        case countryBirth = "_countryBirth"
        case nationality = "_nationality"
        case team = "_team"
        case points = "points"
        case points_sprint = "pointsSprint"
        case nb_bestLap = "nbBestLap"
    }
}
