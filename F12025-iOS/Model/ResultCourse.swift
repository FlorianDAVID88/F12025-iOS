//
//  ResultCourse.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/16/23.
//

import Foundation

struct ResultCourse: Codable {
    var id_result: String
    var name_result: String
    var isSprint: Bool
    var pilot: Pilot
    var gp: GrandPrix
    var position: Int
    var points: Int
    var bestLap: Bool
    
    enum CodingKeys: String, CodingKey {
        case id_result = "_id"
        case name_result = "name"
        case isSprint = "isSprint"
        case pilot = "_pilot"
        case gp = "_grandPrix"
        case position = "position"
        case points = "points"
        case bestLap = "best_lap"
    }
}
