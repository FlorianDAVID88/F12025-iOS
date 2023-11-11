//
//  Country.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/13/23.
//

import Foundation

struct Country: Codable {
    var id_country: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id_country = "_id"
        case name = "name"
    }
}
