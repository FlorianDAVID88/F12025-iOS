//
//  GPView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import SwiftUI

struct GPView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    @State var gp: GrandPrix
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                VStack(spacing: 10) {
                    Text(gp.nom)
                        .font(.custom("Formula1-Display-Bold", size: 26))
                        .multilineTextAlignment(.center)
                    
                    Text(gp.circuit.nom)
                        .font(.custom("Formula1", size: 18))
                    
                    HStack(spacing: 10) {
                        Text(gp.circuit.ville)
                            .font(.custom("Formula1", size: 14))
                        
                        FlagView(pays: gp.circuit.pays, height: 20)
                    }
                }
                
                Image(gp.circuit.nom)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                VStack(spacing: 10) {
                    let winner = viewModel.getWinner(gp: gp)
                    Text("Vainqueur 2025 : ")
                        .font(.custom("Formula1", size: 18))
                    
                    NavigationLink(destination: PilotView(pilot: winner)) {
                        HStack {
                            FlagView(pays: winner.nationalite, height: 20)
                            Text("\(winner.prenom) \(winner.nom)")
                                .font(.custom("Formula1-Display-Wide", size: 14))
                        }
                        .foregroundColor(.primary)
                    }
                }
                
                //km_tour: 5.281, nb_tours: 58, virages: 16, zonesDRS: 2
                VStack {
                    CaractCircuitView(caract: "Longueur du circuit", content: String(format: "%.3f", gp.km_tour), unity: "km")
                    CaractCircuitView(caract: "Nombre de tours", content: "\(gp.nb_tours)", unity: "")
                    CaractCircuitView(caract: "Distance à parcourir", content: String(format: "%.3f",  gp.km_tour * Double(gp.nb_tours)), unity: "km")
                    CaractCircuitView(caract: "Nombre de virages", content: "\(gp.virages)", unity: "")
                    CaractCircuitView(caract: "Zones de DRS", content: "\(gp.zonesDRS)", unity: "")
                }
            }
        }
    }
}

struct GPView_Previews: PreviewProvider {
    static var previews: some View {
        GPView(gp: GrandPrix.allCases[11])
            .environmentObject(F1ViewModel())
    }
}
