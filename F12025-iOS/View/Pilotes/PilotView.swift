//
//  PilotView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import SwiftUI

struct PilotView: View {
    @State var pilot: Pilote
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(spacing: 15) {
                    FlagView(pays: pilot.nationalite, height: 30)
                    Text("\(pilot.prenom) \(pilot.nom)")
                        .font(.custom("Formula1-Display-Bold", size: 32))
                }
                HStack(spacing: 15) {
                    Image("\(pilot.prenom) \(pilot.nom)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                    
                    Image("\(pilot.team.nom_ecurie)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal)
                
                NumberRiderView(pilot: pilot, fontSize: 48)           
                VictoriesPilotView(pilot: pilot)
                
                VStack {
                    Text("Classements")
                        .font(.custom("Formula1", size: 24))
                    
                    GraphCltPilotView(pilote: pilot)
                }
            }
        }
    }
}

struct PilotView_Previews: PreviewProvider {
    static var previews: some View {
        PilotView(pilot: Pilote.allCases[8])
    }
}
