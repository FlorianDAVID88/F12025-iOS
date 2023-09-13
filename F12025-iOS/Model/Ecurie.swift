//
//  Ecurie.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import Foundation

struct Ecurie {
    var id_ecurie = UUID()
    var nom_ecurie: String
    var nationalite: Pays
    
    static var allCases: [Ecurie] = [
        Ecurie(nom_ecurie: "Oracle Red Bull", nationalite: .Autriche),
        Ecurie(nom_ecurie: "Ferrari", nationalite: .Italie),
        Ecurie(nom_ecurie: "Mercedes-AMG Petronas", nationalite: .Allemagne),
        Ecurie(nom_ecurie: "Alpine", nationalite: .France),
        Ecurie(nom_ecurie: "McLaren", nationalite: .GB),
        Ecurie(nom_ecurie: "Aston Martin", nationalite: .GB),
        Ecurie(nom_ecurie: "Williams", nationalite: .GB),
        Ecurie(nom_ecurie: "Audi", nationalite: .Allemagne),
        Ecurie(nom_ecurie: "Haas", nationalite: .USA),
        Ecurie(nom_ecurie: "Hugo Boss", nationalite: .Allemagne)
    ]
}
