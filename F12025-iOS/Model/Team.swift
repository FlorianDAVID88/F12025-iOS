//
//  Team.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/13/23.
//

import Foundation

struct Team: Codable {
    var id_team: String
    var name: String
    var completeName: String
    var nationality: Country
    var points: Int
    var points_sprint: Int
    
    enum CodingKeys: String, CodingKey {
        case id_team = "_id"
        case name = "name"
        case completeName = "completeName"
        case nationality = "_nationality"
        case points = "points"
        case points_sprint = "pointsSprint"
    }
}
