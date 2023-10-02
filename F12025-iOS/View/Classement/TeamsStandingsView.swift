//
//  TeamsStandingsView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/16/23.
//

import SwiftUI

struct TeamsStandingsView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(cltConstructeurs().indices, id: \.self) { i in
                let ec = cltConstructeurs()[i]
                NavigationLink(destination: TeamView(team: ec)) {
                    HStack {
                        Text("\(i+1)")
                            .font(Font.custom("Formula1-Display-Bold", size: 24))
                            .frame(width: 40)
                        
                        Image("\(ec.nom_ecurie)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 50)
                        
                        Text("\(ec.nom_ecurie)")
                            .font(Font.custom("Formula1-Display-Bold", size: 24))
                            .frame(width: 175)
                            .multilineTextAlignment(.leading)

                        Text("\(viewModel.getTotalPoints(team: ec)) pts".uppercased())
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
    
    func cltConstructeurs() -> [Ecurie] {
        return viewModel.ecuries.sorted { viewModel.getTotalPoints(team: $0) > viewModel.getTotalPoints(team: $1) }
    }
}

struct TeamsStandingsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsStandingsView()
            .environmentObject(F1ViewModel())
    }
}