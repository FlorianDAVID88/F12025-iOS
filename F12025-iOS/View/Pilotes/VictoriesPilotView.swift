//
//  VictoriesPilotView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/18/23.
//

import SwiftUI

struct ListVictoriesView: View {
    @State var victories: [Résultat]
    @State var is_GP: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                       
            if victories.count != 0 {
                Text("Victoires \(is_GP ? "GP" : "Sprint") (\(victories.count)) : ")
                    .font(.custom("Formula1", size: 20))
                
                ForEach(victories, id: \.self.id_resultat) { vict in
                    VStack {
                        if vict.cltGP == 1 {
                            HStack(spacing: 10) {
                                Image("Victory")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                
                                Text("\(vict.gp.nom)")
                                    .font(.custom("Formula1-Display-Wide", size: 16))
                            }
                        }
                        if vict.cltSprint == 1 {
                            HStack(spacing: 10) {
                                Image("Victory")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                
                                Text("Course sprint de \(vict.gp.nom)")
                                    .font(.custom("Formula1-Display-Wide", size: 16))
                            }
                        }
                    }
                }
            }
        }

    }
}

struct VictoriesPilotView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    @State var pilot: Pilote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            let victoriesGP = viewModel.getVictoriesGPFrom(pilot: pilot)
            let victoriesSprint = viewModel.getVictoriesSprintFrom(pilot: pilot)
                       
            ListVictoriesView(victories: victoriesGP, is_GP: true)
            ListVictoriesView(victories: victoriesSprint, is_GP: false)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 5)
    }
}

struct VictoriesPilotView_Previews: PreviewProvider {
    static var previews: some View {
        VictoriesPilotView(pilot: Pilote.allCases[3])
            .environmentObject(F1ViewModel())
    }
}
