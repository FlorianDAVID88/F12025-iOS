//
//  TeamView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import SwiftUI

struct TeamView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    @State var team: Ecurie
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Image(team.nom_ecurie)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding()
                    .border(Color.gray)
                
                Text(team.nom_ecurie)
                    .font(.custom("Formula1-Display-Bold", size: 32))
                
                HStack {
                    FlagView(pays: team.nationalite, height: 25)
                    Text(LocalizedStringKey(team.nationalite.rawValue))
                        .font(.custom("Formula1", size: 16))
                }
            }
            
            VStack(alignment: .leading) {
                NavigationLink(destination: MonoplaceView(monoplace: team.monoplace)) {
                    Image("\(team.nom_ecurie) - Monoplace")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Text("description_pilots")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Formula1", size: 24))
                
                HStack {
                    ForEach(viewModel.getPilotesFromEcurie(ecurie: team), id: \.self.id_pilote) { pilot in
                        NavigationLink(destination: PilotView(pilot: pilot)) {
                            VStack {
                                Image("\(pilot.prenom) \(pilot.nom)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                
                                HStack {
                                    NumberRiderView(pilot: pilot, fontSize: 20)
                                    
                                    FlagView(pays: pilot.nationalite, height: 15)
                                    Text("\(pilot.prenom) \(pilot.nom)")
                                        .font(.custom("Formula1-Display-Wide", size: 9))
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle(Text("\(team.nom_ecurie)"), displayMode: .inline)
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(team: Ecurie.allCases[7])
            .environmentObject(F1ViewModel())
    }
}
