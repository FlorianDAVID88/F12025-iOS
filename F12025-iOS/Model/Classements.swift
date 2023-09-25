//
//  Classements.swift
//  F12025-iOS
//
//  Created by user234243 on 9/18/23.
//

import Foundation

struct CltGP {
    var id_cltGP: UUID
    var nb_pts: Int
    
    init(place: Int) {
        self.id_cltGP = UUID()
        switch(place) {
            case 1: self.nb_pts = 25
            case 2: self.nb_pts = 18
            case 3: self.nb_pts = 15
            case 4: self.nb_pts = 12
            case 5: self.nb_pts = 10
            case 6: self.nb_pts = 8
            case 7: self.nb_pts = 6
            case 8: self.nb_pts = 4
            case 9: self.nb_pts = 2
            case 10: self.nb_pts = 1
            default: self.nb_pts = 0
        }
    }
}

struct CltSprint {
    var id_cltSprint: UUID
    var nb_pts: Int
    
    init(place: Int) {
        self.id_cltSprint = UUID()
        self.nb_pts = place > 0 && place < 9 ? 9 - place : 0
    }
}
