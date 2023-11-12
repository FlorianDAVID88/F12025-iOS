//
//  GPView.swift
//  F1 2025
//
//  Created by Florian DAVID on 05/11/2023.
//

import SwiftUI

struct GPView: View {
    @EnvironmentObject var f1vm: F1ViewModel
    @EnvironmentObject var apiModel: APIViewModel
    @State var gp: GrandPrix
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                VStack(spacing: 10) {
                    Text(LocalizedStringKey(gp.name))
                        .font(.custom("Formula1-Display-Bold", size: 26))
                        .multilineTextAlignment(.center)
                    
                    Button {
                        f1vm.locationGoogleMaps(location: gp.circuit.name)
                    } label: {
                        Text(gp.circuit.name)
                            .font(.custom("Formula1", size: 18))
                            .foregroundColor(.primary)
                    }
                    
                    HStack(spacing: 10) {
                        Text(gp.circuit.city)
                            .font(.custom("Formula1", size: 14))
                        
                        FlagView(pays: gp.circuit.country, height: 20)
                    }
                }
                
                Image(gp.circuit.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                /*VStack(spacing: 10) {
                    let winner = viewModel.getWinner(gp: gp)
                    Text("Vainqueur 2025 :")
                        .font(.custom("Formula1", size: 18))
                    
                    NavigationLink(destination: PilotView(pilot: winner)) {
                        HStack {
                            FlagView(pays: winner.nationalite, height: 20)
                            Text("\(winner.prenom) \(winner.nom)")
                                .font(.custom("Formula1-Display-Wide", size: 14))
                        }
                        .foregroundColor(.primary)
                    }
                }*/
                
                VStack {
                    CaractCircuitView(caract: "Longueur du circuit", content: String(format: "%.3f", gp.kmLap), unity: "km")
                    CaractCircuitView(caract: "Nombre de tours", content: "\(gp.nbLaps)", unity: "")
                    CaractCircuitView(caract: "Distance à parcourir", content: String(format: "%.3f",  gp.kmLap * Double(gp.nbLaps)), unity: "km")
                    CaractCircuitView(caract: "Nombre de virages", content: "\(gp.nbTurns)", unity: "")
                    CaractCircuitView(caract: "Zones de DRS", content: "\(gp.nbDRS)", unity: "")
                }
            }
        }
    }
}


#Preview {
    GPView(gp: GrandPrix(id_gp: "", name: "Grand Prix de France", circuit: GrandPrix.Circuit(name: "Circuit de Nevers-Magny-Cours", city: "Nevers", country: Country(id_country: "", name: "France")), dateStart: "12/09", dateFinish: "14/09", sprint: false, kmLap: 6.009, nbLaps: 60, nbTurns: 17, nbDRS: 2))
        .environmentObject(F1ViewModel())
        .environmentObject(APIViewModel())
}
