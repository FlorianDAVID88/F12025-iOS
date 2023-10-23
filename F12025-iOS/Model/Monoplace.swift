//
//  Monoplace.swift
//  F1 2025
//
//  Created by user234243 on 10/9/23.
//

import Foundation

struct Monoplace {
    var id_monoplace = UUID()
    var nom_monoplace: String
    var chassis: String
    var moteur: Moteur
    var cylindree: Int
    var boite_vitesses: BoiteVitesses
    var type: String
    var electronique: String
    var carburant: String
    var pneumatiques: [Pneu]
    var jantes: String
    var poids: Int
    
    struct Moteur {
        var id_moteur: UUID
        var nom_moteur: String
        var orientation: String
        var position: String
        var configuration: String
        
        init(nom_moteur: String, orientation: String, position: String, configuration: String) {
            self.id_moteur = UUID()
            self.nom_moteur = nom_moteur
            self.orientation = orientation
            self.position = position
            self.configuration = configuration
        }
    }
    
    struct BoiteVitesses {
        var id_boite: UUID
        var caracts: String
        var nb_rapports: Int
        var marche_arriere: Bool
        
        init(caracts: String, nb_rapports: Int, marche_arriere: Bool) {
            self.id_boite = UUID()
            self.caracts = caracts
            self.nb_rapports = nb_rapports
            self.marche_arriere = marche_arriere
        }
    }
    
    struct Pneu {
        var id_pneu: UUID
        var nom_pneu: String
        var type: TypePneu
        
        enum TypePneu: String, CaseIterable {
            case Sec, Humide
        }
        
        init(nom_pneu: String, type: TypePneu) {
            self.id_pneu = UUID()
            self.nom_pneu = nom_pneu
            self.type = type
        }
    }
    
    init(nom_monoplace: String, nom_moteur: String, posMoteur: String, caractBV: String, type: String, carburant: String) {
        self.id_monoplace = UUID()
        self.nom_monoplace = nom_monoplace
        self.chassis = "Monocoque composite moulée en fibre de carbone et nid d'abeilles"
        self.moteur = Moteur(nom_moteur: nom_moteur, orientation: "Longitudinale", position: posMoteur, configuration: "V6 turbo ouvert à 90°, limité à 15 000 tr/min")
        self.cylindree = 1600
        self.boite_vitesses = BoiteVitesses(caracts: caractBV, nb_rapports: 8, marche_arriere: true)
        self.type = type
        self.electronique = nom_monoplace == "A523" ? "Boîtier électronique standard MES-Microsoft" : "Allumage et injection électroniques"
        self.carburant = carburant
        self.pneumatiques = [
            Pneu(nom_pneu: "Pirelli PZero", type: .Sec),
            Pneu(nom_pneu: "Cinturato", type: .Humide)
          ]
        self.jantes = "BBS"
        self.poids = 796
    }
    
    static var allCases: [Monoplace] = [
        Monoplace(nom_monoplace: "RB21",
                  nom_moteur: "Honda RBPT",
                  posMoteur: "Centrale",
                  caractBV: "Semi-automatique et longitudinale arrière, système Quickshift hydraulique, gestion de l'embrayage et des rapports au volant.",
                  type: "\n - Changement rapide\n - Différentiel à glissement limité semi-automatique séquentielle électronique seamless",
                  carburant: "Esso"),
        Monoplace(nom_monoplace: "SF-25",
                  nom_moteur: "Ferrari",
                  posMoteur: "Centrale-arrière",
                  caractBV: "Ferrari, semi-automatique et longitudinale",
                  type: "Changement rapide",
                  carburant: "Shell V-Power"),
        Monoplace(nom_monoplace: "W16 E Performance",
                  nom_moteur: "Mercedes-AMG",
                  posMoteur: "Centrale-arrière",
                  caractBV: "Semi-automatique et longitudinale",
                  type: "Changement rapide",
                  carburant: "Petronas Primax"),
        Monoplace(nom_monoplace: "A525",
                  nom_moteur: "Renault E-Tech RE23",
                  posMoteur: "Centrale",
                  caractBV: "Longitudinale",
                  type: "Changement rapide",
                  carburant: "BP"),
        Monoplace(nom_monoplace: "MCL62",
                  nom_moteur: "Mercedes-AMG",
                  posMoteur: "Centrale",
                  caractBV: "Semi-automatique et longitudinale",
                  type: "\n - Changement rapide\n - Différentiel à glissement limité semi-automatique séquentielle électronique seamless",
                  carburant: ""),
        Monoplace(nom_monoplace: "C45",
                  nom_moteur: "Ferrari",
                  posMoteur: "Centrale-arrière",
                  caractBV: "Ferrari, semi-automatique et longitudinale",
                  type: "Changement rapide",
                  carburant: "Shell V-Power"),
        Monoplace(nom_monoplace: "AMR25",
                  nom_moteur: "Mercedes-AMG",
                  posMoteur: "Centrale-arrière",
                  caractBV: "Semi-automatique et longitudinale",
                  type: "\n - Changement rapide\n - Différentiel à glissement limité semi-automatique séquentielle électronique seamless",
                  carburant: "Petronas"),
        Monoplace(nom_monoplace: "VF-25",
                  nom_moteur: "Ferrari",
                  posMoteur: "Centrale-arrière",
                  caractBV: "Ferrari, semi-automatique et longitudinale",
                  type: "\n - Changement rapide\n - Différentiel à glissement limité semi-automatique séquentielle électronique seamless",
                  carburant: "Shell V-Power"),
        Monoplace(nom_monoplace: "HB06",
                  nom_moteur: "Honda RBPT",
                  posMoteur: "Centrale-arrière",
                  caractBV: "Semi-automatique et longitudinale",
                  type: "\n - Changement rapide\n - Différentiel à glissement limité semi-automatique séquentielle électronique seamless",
                  carburant: "Esso"),
        Monoplace(nom_monoplace: "FW47",
                  nom_moteur: "Mercedes-AMG",
                  posMoteur: "Centrale-arrière",
                  caractBV: "Semi-automatique et longitudinale",
                  type: "Changement rapide",
                  carburant: "Petronas")
    ]
    
}
