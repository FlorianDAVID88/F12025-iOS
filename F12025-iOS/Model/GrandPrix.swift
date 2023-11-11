//
//  GrandPrix.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/25/23.
//

import Foundation

struct GrandPrix: Codable {
    var id_gp: String
    var name: String
    var circuit: Circuit
    var dateStart: String
    var dateFinish: String
    var sprint: Bool
    var kmLap: Double
    var nbLaps: Int
    var nbTurns: Int
    var nbDRS: Int
    
    enum CodingKeys: String, CodingKey {
        case id_gp = "_id"
        case name = "name"
        case circuit = "circuit"
        case dateStart = "date_start"
        case dateFinish = "date_finish"
        case sprint = "sprint"
        case kmLap = "km_lap"
        case nbLaps = "nb_laps"
        case nbTurns = "nb_turns"
        case nbDRS = "nb_DRS"
    }
    
    struct Circuit: Codable {
        var name: String
        var city: String
        var country: Country
    }
}
