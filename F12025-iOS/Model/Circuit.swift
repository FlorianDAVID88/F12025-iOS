//
//  Circuit.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import Foundation

struct Circuit {
    var id_circuit = UUID()
    var nom: String
    var ville: String
    var pays: Pays
    
    mutating func equalsTo(circ: Circuit) -> Bool {
        return self.id_circuit == circ.id_circuit && self.nom == circ.nom && self.ville == circ.ville && self.pays == circ.pays
    }
}
