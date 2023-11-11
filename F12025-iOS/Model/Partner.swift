//
//  Partner.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/27/23.
//

import Foundation

struct Partner: Codable {
    var id_partner: String
    var name: String
    var type: TypePartner
    var site: Website
    
    enum CodingKeys: String, CodingKey {
        case id_partner = "_id"
        case name = "name"
        case type = "type"
        case site = "site"
    }
    
    enum TypePartner: String, CaseIterable, Codable {
        case Mondial = "Partenaire mondial"
        case Officiel = "Partenaire officiel"
        case Régional = "Partenaire régional"
        case Fournisseur = "Fournisseur officiel"
    }
    
    struct Website: Codable {
        var name: String
        var url: String
        var url_as: String
    }
}
