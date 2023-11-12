//
//  TeamsStandingsView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/16/23.
//

import SwiftUI

struct TeamsStandingsView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    @EnvironmentObject var apiModel: APIViewModel
    @Binding var sprint: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            let teams = apiModel.teams.sorted(by: {
                if sprint {
                    return $0.points_sprint > $1.points_sprint
                } else {
                    return $0.points > $1.points
                }
            })
            ForEach(teams.indices, id: \.self) { i in
                let team = teams[i]
                NavigationLink(destination: TeamView(team: team)) {
                    HStack {
                        Text("\(i+1)")
                            .modifier(F1Bold(size: 24))
                            .frame(width: 40)
                        
                        Image("\(team.name)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 50)
                        
                        Text("\(team.name)")
                            .modifier(F1Bold(size: 20))
                            .multilineTextAlignment(.leading)

                        Spacer()
                        
                        Text("\(sprint ? team.points_sprint : team.points) pts".uppercased())
                            .padding(10)
                            .background(.black)
                            .cornerRadius(10)
                            .modifier(F1Regular(size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: 75)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .padding(.horizontal, 5)
    }
}

struct TeamsStandingsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsStandingsView(sprint: Binding.constant(false))
            .environmentObject(F1ViewModel())
            .environmentObject(APIViewModel())
    }
}
