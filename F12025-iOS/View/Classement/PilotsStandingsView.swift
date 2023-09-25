//
//  PilotsStandingsView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/16/23.
//

import SwiftUI

struct PilotsStandingsView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(cltPilotes().indices, id: \.self) { i in
                    let pilot = cltPilotes()[i]
                    NavigationLink(destination: PilotView(pilot: pilot)) {
                        HStack {
                            Text("\(i+1)")
                                .font(Font.custom("Formula1-Display-Bold", size: 24))
                                .frame(width: 40)
                            
                            Image("\(pilot.prenom) \(pilot.nom)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                            
                            Text("\(pilot.prenom) \(pilot.nom)")
                                .font(Font.custom("Formula1-Display-Bold", size: 18))
                                .frame(width: 220)
                                .multilineTextAlignment(.leading)
                            
                            Text("\(viewModel.getTotalPoints(pilot: pilot)) pts".uppercased())
                                .padding(10)
                                .background(.black)
                                .cornerRadius(10)
                                .font(Font.custom("Formula1", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 75)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
    }
    
    func cltPilotes() -> [Pilote] {
        return viewModel.pilotes.sorted { viewModel.getTotalPoints(pilot: $0) > viewModel.getTotalPoints(pilot: $1) }
    }
}

struct PilotsStandingsView_Previews: PreviewProvider {
    static var previews: some View {
        PilotsStandingsView()
            .environmentObject(F1ViewModel())
    }
}
