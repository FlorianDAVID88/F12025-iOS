//
//  TeamsView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import SwiftUI

struct AllTeamsView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    
    var body: some View {
        VStack {
            Text("Ecuries")
                .font(.custom("Formula1-Display-Bold", size: 32))
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(Ecurie.allCases, id: \.self.id_ecurie) { ecurie in
                        NavigationLink(destination: TeamView(team: ecurie)) {
                            HStack {
                                ItemTeamView(team: ecurie)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        AllTeamsView()
            .environmentObject(F1ViewModel())
    }
}
