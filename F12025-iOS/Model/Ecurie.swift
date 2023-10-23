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
    var monoplace: Monoplace
    var nb_pts: Int
    
    init(nom_ecurie: String, nationalite: Pays, monoplace: String) {
        self.id_ecurie = UUID()
        self.nom_ecurie = nom_ecurie
        self.nationalite = nationalite
        self.monoplace = getMonoplaceFrom(car: monoplace)
        self.nb_pts = 0
    }
    
    static var allCases: [Ecurie] = [
        Ecurie(nom_ecurie: "Red Bull", nationalite: .Autriche, monoplace: "RB21"),
        Ecurie(nom_ecurie: "Ferrari", nationalite: .Italie, monoplace: "SF-25"),
        Ecurie(nom_ecurie: "Mercedes", nationalite: .Allemagne, monoplace: "W16 E Performance"),
        Ecurie(nom_ecurie: "Alpine", nationalite: .France, monoplace: "A525"),
        Ecurie(nom_ecurie: "McLaren", nationalite: .GB, monoplace: "MCL62"),
        Ecurie(nom_ecurie: "Aston Martin", nationalite: .GB, monoplace: "AMR25"),
        Ecurie(nom_ecurie: "Williams", nationalite: .GB, monoplace: "FW47"),
        Ecurie(nom_ecurie: "Audi", nationalite: .Allemagne, monoplace: "C45"),
        Ecurie(nom_ecurie: "Haas", nationalite: .USA, monoplace: "VF-25"),
        Ecurie(nom_ecurie: "Hugo Boss", nationalite: .Allemagne, monoplace: "HB06")
    ]
    
    static func getEcurieFromName(team: String) -> Ecurie {
        return allCases.filter { $0.nom_ecurie == team }.first!
    }
    
    mutating func equalsTo(ecurie: Ecurie) -> Bool {
        return self.id_ecurie == ecurie.id_ecurie && self.nom_ecurie == ecurie.nom_ecurie && self.nationalite == ecurie.nationalite
    }
}

func getMonoplaceFrom(car: String) -> Monoplace {
    return Monoplace.allCases.filter { $0.nom_monoplace == car }.first!
}
