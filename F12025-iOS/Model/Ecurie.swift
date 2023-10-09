//
//  Ecurie.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import Foundation

struct Ecurie {
    var id_ecurie: UUID
    var nom_ecurie: String
    //var nom_complet: String
    var nationalite: Pays
    var nb_pts: Int
    
    init(nom_ecurie: String, nationalite: Pays) {
        self.id_ecurie = UUID()
        self.nom_ecurie = nom_ecurie
        self.nationalite = nationalite
        self.nb_pts = 0
    }
    
    static var allCases: [Ecurie] = [
        Ecurie(nom_ecurie: "Red Bull", nationalite: .Autriche),
        Ecurie(nom_ecurie: "Ferrari", nationalite: .Italie),
        Ecurie(nom_ecurie: "Mercedes", nationalite: .Allemagne),
        Ecurie(nom_ecurie: "Alpine", nationalite: .France),
        Ecurie(nom_ecurie: "McLaren", nationalite: .GB),
        Ecurie(nom_ecurie: "Aston Martin", nationalite: .GB),
        Ecurie(nom_ecurie: "Williams", nationalite: .GB),
        Ecurie(nom_ecurie: "Audi", nationalite: .Allemagne),
        Ecurie(nom_ecurie: "Haas", nationalite: .USA),
        Ecurie(nom_ecurie: "Hugo Boss", nationalite: .Allemagne)
    ]
    
    static func getEcurieFromName(team: String) -> Ecurie {
        return allCases.filter { $0.nom_ecurie == team }.first!
    }
    
    mutating func equalsTo(ecurie: Ecurie) -> Bool {
        return self.id_ecurie == ecurie.id_ecurie && self.nom_ecurie == ecurie.nom_ecurie && self.nationalite == ecurie.nationalite
    }
}
