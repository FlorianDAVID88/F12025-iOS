//
//  VictoriesPilotView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/18/23.
//

import SwiftUI

struct ListVictoriesView: View {
    @State var victories: [ResultCourse]
    @State var is_GP: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if victories.count != 0 {
                Text("Victoires \(is_GP ? "GP" : "Sprint") (\(victories.count)) : ")
                    .font(.custom("Formula1", size: 20))
                
                ForEach(victories, id: \.self.id_result) { vict in
                    VStack {
                        if vict.position == 1 {
                            HStack(spacing: 10) {
                                Image("Victory")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                
                                Text("\(vict.gp.name)")
                                    .font(.custom("Formula1-Display-Wide", size: 16))
                            }
                        }
                        if vict.position == 1 && vict.isSprint {
                            HStack(spacing: 10) {
                                Image("Victory")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                
                                Text("Course sprint de \(vict.gp.name)")
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
    @EnvironmentObject var viewModel: APIViewModel
    @State var pilot: Pilot
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            let victoriesGP = getVictoriesPilot(forSprint: false)
            let victoriesSprint = getVictoriesPilot(forSprint: true)
            
            ListVictoriesView(victories: victoriesGP, is_GP: true)
            ListVictoriesView(victories: victoriesSprint, is_GP: false)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 5)
    }
    
    func getVictoriesPilot(forSprint: Bool) -> [ResultCourse] {
        return []
        //return viewModel.getResultsFromPilot(pilot: pilot).filter { $0.position == 1 && $0.isSprint == forSprint }
    }
}

struct VictoriesPilotView_Previews: PreviewProvider {
    static var previews: some View {
        VictoriesPilotView(pilot: Pilot())
            .environmentObject(APIViewModel())
    }
}
