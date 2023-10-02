//
//  ItemView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import SwiftUI

struct ItemGPView: View {
    @State var gp: GrandPrix
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                FlagView(pays: gp.circuit.pays, height: 35)
                Text("\(gp.dates[0])\n\(gp.dates[1])")
                    .font(.custom("Formula1", size: 12))
                    .padding(5)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(LocalizedStringKey(gp.nom))
                    .bold()
                    .font(.custom("Formula1-Display-Bold", size: 20))
                
                Text(gp.circuit.nom)
                    .font(.custom("Formula1", size: 14))
                
            }
            .multilineTextAlignment(.leading)
        }
    }
}

struct ItemPilotView: View {
    @State var pilot: Pilote
    
    var body: some View {
        let pilotName = "\(pilot.prenom) \(pilot.nom)"
        HStack(spacing: 20) {
            Image(pilotName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 75)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(pilotName)
                    .font(.custom("Formula1-Display-BOLD", size: 20))
                    .foregroundColor(.black)

                HStack(spacing: 10) {
                    FlagView(pays: pilot.nationalite, height: 20)
                    Image(pilot.team.nom_ecurie)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                }
            }
        }
    }
}

struct ItemTeamView: View {
    @State var team: Ecurie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(team.nom_ecurie)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(team.nom_ecurie)
                    .font(.custom("Formula1-Display-BOLD", size: 20))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                
                FlagView(pays: team.nationalite, height: 20)
            }
        }
        
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            ItemGPView(gp: GrandPrix.allCases[0])
            ItemPilotView(pilot: Pilote.allCases[15])
            ItemTeamView(team: Ecurie.allCases[7])
        }
    }
}
