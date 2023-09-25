//
//  F1ViewModel.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import Foundation

class F1ViewModel: ObservableObject {
    @Published var ecuries: [Ecurie] = Ecurie.allCases
    @Published var pilotes: [Pilote] = Pilote.allCases
    @Published var all_gp: [GrandPrix] = GrandPrix.allCases
    @Published var resultsF1: [Résultat] = Résultat.allCases()
    
    func getPilotesFromEcurie(ecurie: Ecurie) -> [Pilote] {
        var pilots: [Pilote] = []
        for var p in self.pilotes {
            if p.team.equalsTo(ecurie: ecurie) {
                pilots.append(p)
            }
        }
        return pilots
    }
    
    func getTotalPoints(pilot: Pilote) -> Int {
        var pts = 0
        var usingPilot = pilot
        let results = resultsF1.filter { usingPilot.equalsTo(pilot: $0.pilot) }
        
        for res in results {
            pts += (res.ptsGP + res.ptsSprint)
            if res.bestTour { pts += 1 }
        }
        
        return pts
    }
    
    func getTotalPoints(team: Ecurie) -> Int {
        var pts = 0
        let pilotsEcurie = getPilotesFromEcurie(ecurie: team)
        
        for pil in pilotsEcurie {
            pts += getTotalPoints(pilot: pil)
        }
        
        return pts
    }
    
    func getTotalSprintPoints(pilot: Pilote) -> Int {
        var pts = 0
        var usingPilot = pilot
        let results = resultsF1.filter { usingPilot.equalsTo(pilot: $0.pilot) && $0.gp.sprint }
        
        for res in results {
            pts += res.ptsSprint
        }
        
        return pts
    }
    
    func getTotalSprintPoints(team: Ecurie) -> Int {
        var pts = 0
        let pilotsEcurie = getPilotesFromEcurie(ecurie: team)
        
        for pil in pilotsEcurie {
            pts += getTotalSprintPoints(pilot: pil)
        }
        
        return pts
    }
    
    func getVictoriesGPFrom(pilot: Pilote) -> [Résultat] {
        var usingPilot = pilot
        let results = resultsF1.filter { usingPilot.equalsTo(pilot: $0.pilot) }
        return results.filter { $0.cltGP == 1 }
    }
    
    func getVictoriesSprintFrom(pilot: Pilote) -> [Résultat] {
        var usingPilot = pilot
        let results = resultsF1.filter { usingPilot.equalsTo(pilot: $0.pilot) }
        return results.filter { $0.cltSprint == 1 }
    }
    
    func getWinner(gp: GrandPrix) -> Pilote {
        var sameGP = gp
        let results = Résultat.allCases().filter { sameGP.equalsTo(gp: $0.gp) && $0.cltGP == 1 }
        print(results.count)
        return results[0].pilot
    }
}
