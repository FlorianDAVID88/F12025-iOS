//
//  AllTeamsView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/13/23.
//

import SwiftUI

struct AllTeamsView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    @EnvironmentObject var apiModel: APIViewModel
    
    var body: some View {
        VStack {            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(apiModel.teams, id: \.self.id_team) { team in
                        NavigationLink(destination: TeamView(team: team)) {
                            HStack {
                                ItemTeamView(team: team)
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
            .environmentObject(APIViewModel())
    }
}
