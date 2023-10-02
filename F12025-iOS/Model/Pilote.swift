//
//  Pilote.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import Foundation

struct Pilote {
    var id_pilote: UUID
    var num_pilote: Int
    var prenom: String
    var nom: String
    var date_naissance: String
    var lieu_naissance: String
    var pays_naissance: Pays
    var nationalite: Pays
    var team: Ecurie
    
    init(num_pilote: Int, prenom: String, nom: String, date_naissance: String, lieu_naissance: String, pays_naissance: Pays, team: Ecurie) {
        self.id_pilote = UUID()
        self.num_pilote = num_pilote
        self.prenom = prenom
        self.nom = nom
        self.date_naissance = date_naissance
        self.lieu_naissance = lieu_naissance
        self.pays_naissance = pays_naissance
        self.nationalite = pays_naissance
        self.team = team
    }
    
    init(num_pilote: Int, prenom: String, nom: String, date_naissance: String, lieu_naissance: String, pays_naissance: Pays, nationalite: Pays, team: Ecurie) {
        self.id_pilote = UUID()
        self.num_pilote = num_pilote
        self.prenom = prenom
        self.nom = nom
        self.date_naissance = date_naissance
        self.lieu_naissance = lieu_naissance
        self.pays_naissance = pays_naissance
        self.nationalite = nationalite
        self.team = team
    }
    
    static var allCases: [Pilote] = [
        Pilote(num_pilote: 1, prenom: "Max", nom: "Verstappen", date_naissance: "30/09/1997", lieu_naissance: "Hasselt", pays_naissance: .Belgique, nationalite: .PB, team: getEcurie(name: "Red Bull")),
        Pilote(num_pilote: 4, prenom: "Lando", nom: "Norris", date_naissance: "13/11/1999", lieu_naissance: "Bristol", pays_naissance: .GB, team: getEcurie(name: "Red Bull")),
        Pilote(num_pilote: 63, prenom: "George", nom: "Russell", date_naissance: "15/02/1998", lieu_naissance: "King's Lynn", pays_naissance: .GB, team: getEcurie(name: "Mercedes")),
        Pilote(num_pilote: 31, prenom: "Esteban", nom: "Ocon", date_naissance: "17/07/1996", lieu_naissance: "Évreux", pays_naissance: .France, team: getEcurie(name: "Mercedes")),
        Pilote(num_pilote: 16, prenom: "Charles", nom: "Leclerc", date_naissance: "16/10/1997", lieu_naissance: "Monte-Carlo", pays_naissance: .Monaco, team: getEcurie(name: "Ferrari")),
        Pilote(num_pilote: 23, prenom: "Alexander", nom: "Albon", date_naissance: "23/03/1996", lieu_naissance: "Londres", pays_naissance: .GB, nationalite: .Thaïlande, team: getEcurie(name: "Ferrari")),
        Pilote(num_pilote: 14, prenom: "Fernando", nom: "Alonso", date_naissance: "29/07/1981", lieu_naissance: "Oviedo", pays_naissance: .Espagne, team: getEcurie(name: "Aston Martin")),
        Pilote(num_pilote: 34, prenom: "Felipe", nom: "Drugovich", date_naissance: "23/05/2000", lieu_naissance: "Maringá", pays_naissance: .Brésil, team: getEcurie(name: "Aston Martin")),
        Pilote(num_pilote: 10, prenom: "Pierre", nom: "Gasly", date_naissance: "07/02/1996", lieu_naissance: "Rouen", pays_naissance: .France, team: getEcurie(name: "Alpine")),
        Pilote(num_pilote: 6, prenom: "Victor", nom: "Martins", date_naissance: "16/06/2001", lieu_naissance: "Quincy-sous-Sénart", pays_naissance: .France, team: getEcurie(name: "Alpine")),
        Pilote(num_pilote: 81, prenom: "Oscar", nom: "Piastri", date_naissance: "06/04/2001", lieu_naissance: "Melbourne", pays_naissance: .Australie, team: getEcurie(name: "McLaren")),
        Pilote(num_pilote: 62, prenom: "Jack", nom: "Doohan", date_naissance: "20/01/2003", lieu_naissance: "Gold Coast", pays_naissance: .Australie, team: getEcurie(name: "McLaren")),
        Pilote(num_pilote: 47, prenom: "Mick", nom: "Schumacher", date_naissance: "22/03/1999", lieu_naissance: "Vufflens-le-Château", pays_naissance: .Suisse, nationalite: .Allemagne, team: getEcurie(name: "Williams")),
        Pilote(num_pilote: 21, prenom: "Frederik", nom: "Vesti", date_naissance: "13/01/2002", lieu_naissance: "Vejle", pays_naissance: .Danemark, team: getEcurie(name: "Williams")),
        Pilote(num_pilote: 24, prenom: "Guanyu", nom: "Zhou", date_naissance: "30/05/1999", lieu_naissance: "Shanghai", pays_naissance: .Chine, team: getEcurie(name: "Haas")),
        Pilote(num_pilote: 39, prenom: "Robert", nom: "Shwartzman", date_naissance: "16/09/1999", lieu_naissance: "Tel-Aviv", pays_naissance: .Israël, team: getEcurie(name: "Haas")),
        Pilote(num_pilote: 55, prenom: "Carlos", nom: "Sainz", date_naissance: "01/09/1994", lieu_naissance: "Madrid", pays_naissance: .Espagne, team: getEcurie(name: "Audi")),
        Pilote(num_pilote: 98, prenom: "Théo", nom: "Pourchaire", date_naissance: "20/08/2003", lieu_naissance: "Grasse", pays_naissance: .France, team: getEcurie(name: "Audi")),
        Pilote(num_pilote: 22, prenom: "Yuki", nom: "Tsunoda", date_naissance: "11/05/2000", lieu_naissance: "Sagamihara", pays_naissance: .Japon, team: getEcurie(name: "Hugo Boss")),
        Pilote(num_pilote: 40, prenom: "Liam", nom: "Lawson", date_naissance: "11/02/2002", lieu_naissance: "Hastings", pays_naissance: .NZ, team: getEcurie(name: "Hugo Boss"))
    ]
    
    mutating func equalsTo(pilot: Pilote) -> Bool {
        return self.id_pilote == pilot.id_pilote && self.num_pilote == pilot.num_pilote && self.prenom == pilot.prenom && self.nom == pilot.nom && self.date_naissance == pilot.date_naissance && self.lieu_naissance == pilot.lieu_naissance && self.pays_naissance == pilot.pays_naissance && self.nationalite == pilot.nationalite && self.team.equalsTo(ecurie: pilot.team)
    }
    
    mutating func getResultsGP() -> [Int] {
        let resultPilot = Résultat.allCases().filter { self.equalsTo(pilot: $0.pilot) }
        var tabRes: [Int] = []
        
        for res in resultPilot {
            tabRes.append(res.cltGP)
        }
        
        return tabRes
    }
}

func getEcurie(name: String) -> Ecurie {
    let team = Ecurie.allCases.filter { $0.nom_ecurie.contains(name) }
    return team.count == 1 ? team[0] : Ecurie(nom_ecurie: "", nationalite: .None)
}
