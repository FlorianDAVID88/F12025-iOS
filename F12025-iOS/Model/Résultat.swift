//
//  Résultat.swift
//  F12025-iOS
//
//  Created by user234243 on 9/16/23.
//

import Foundation

struct Résultat {
    var id_resultat: UUID
    var pilot: Pilote
    var gp: GrandPrix
    var cltGP: Int
    var ptsGP: Int
    var bestTour: Bool
    var cltSprint: Int
    var ptsSprint: Int
    
    init(pilot: Pilote, gp: GrandPrix, cltGP: Int, bestTour: Bool, cltSprint: Int) {
        self.id_resultat = UUID()
        self.pilot = pilot
        self.gp = gp
        self.cltGP = cltGP
        self.ptsGP = CltGP(place: cltGP).nb_pts
        self.bestTour = bestTour
        self.cltSprint = gp.sprint ? cltSprint : 0
        self.ptsSprint = CltSprint(place: self.cltSprint).nb_pts
    }
    
    static func allCases() -> [Résultat] {
        var results: [Résultat] = []
        
        for gp in GrandPrix.allCases {
            results.append(contentsOf: addResultForEachPilot(gp: gp))
        }
        
        return results
    }
}

func addResultForEachPilot(gp: GrandPrix) -> [Résultat] {
    var resultsGP: [Résultat] = []
    let nbPilotes = Pilote.allCases.count
    let clts = generateRandomNumbers(limit: nbPilotes)
    let cltsSprint = generateRandomNumbers(limit: nbPilotes)
    let indexBT = Int.random(in: 1...nbPilotes)
    
    for i in 0..<nbPilotes {
        resultsGP.append(Résultat(pilot: Pilote.allCases[i], gp: gp, cltGP: clts[i], bestTour: i == indexBT - 1, cltSprint: cltsSprint[i]))
    }
    
    return resultsGP
}

/**
 *  Retourne un tableau contenant limit nombres compris entre 1 et limit
 */
func generateRandomNumbers(limit: Int) -> [Int] {
    var numbers = Array(1...limit) // Crée un tableau de nombres de 1 à limit
    var randomNumbers = [Int]() // Crée un tableau pour stocker les tirages

    for _ in 1...limit {
        // Génère un index aléatoire dans la plage des nombres restants
        let randomIndex = Int(arc4random_uniform(UInt32(numbers.count)))
        
        // Récupère le nombre correspondant à l'index
        let randomNumber = numbers[randomIndex]
        
        // Ajoute le nombre tiré au tableau des tirages
        randomNumbers.append(randomNumber)
        
        // Supprime le nombre tiré pour éviter les tirages en double
        numbers.remove(at: randomIndex)
    }
    
    return randomNumbers
}
