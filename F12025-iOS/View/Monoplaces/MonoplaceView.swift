//
//  MonoplaceView.swift
//  F1 2025
//
//  Created by user234243 on 10/9/23.
//

import SwiftUI

struct MonoplaceView: View {
    @State var monoplace: Monoplace
    @State private var motorDetail = false
    @State private var bvDetail = false
    @State private var tyresDetail = false
    
    var body: some View {
        let team = getTeamFromMonoplace()
        VStack {
            Image("\(team.nom_ecurie) - Monoplace")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Chassis : \(monoplace.chassis)")
                    Text("Poids : \(monoplace.poids)kg")
                    DisclosureGroup("Moteur", isExpanded: $motorDetail) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Moteur \(monoplace.moteur.nom_moteur), \(monoplace.moteur.configuration)")
                            Text("- Orientation : \(monoplace.moteur.orientation)")
                            Text("- Position : \(monoplace.moteur.position)")
                        }
                    }
                    .foregroundColor(.primary)
                    
                    DisclosureGroup("Boîte de vitesses", isExpanded: $bvDetail) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("\(monoplace.boite_vitesses.caracts)")
                            Text("\(monoplace.boite_vitesses.nb_rapports) rapports\(monoplace.boite_vitesses.marche_arriere ? " + marche arrière" : "")")
                        }
                    }
                    .foregroundColor(.primary)
                    
                    Text("Cylindrée : \(monoplace.cylindree) cm3")
                    Text("Type : \(monoplace.type)")
                    Text("Électronique : \(monoplace.electronique)")
                    Text("Carburant : \(monoplace.carburant)")

                    DisclosureGroup("Pneumatiques", isExpanded: $tyresDetail) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("- \(monoplace.pneumatiques[0].nom_pneu) (\(monoplace.pneumatiques[0].type.rawValue))")
                            Text("- \(monoplace.pneumatiques[1].nom_pneu) (\(monoplace.pneumatiques[1].type.rawValue))")
                            Text("tous montés sur des jantes \(monoplace.jantes)")
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal)
        .multilineTextAlignment(.leading)
        .font(.custom("Formula1", size: 20))
        .navigationTitle("\(team.nom_ecurie) \(monoplace.nom_monoplace)")
    }

    func getTeamFromMonoplace() -> Ecurie {
        let team = Ecurie.allCases.filter { $0.monoplace.id_monoplace == monoplace.id_monoplace }
        return team.first!
    }
}

struct MonoplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MonoplaceView(monoplace: Monoplace.allCases[3])
    }
}
