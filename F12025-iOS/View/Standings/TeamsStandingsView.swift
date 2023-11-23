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
            switch apiModel.state {
                case .success(let data):
                    if let teams = data as? [Team] {
                        ForEach(teams.indices, id: \.self) { i in
                            let team = teams[i]
                            NavigationLink(destination: TeamView(team: team)) {
                                HStack {
                                    Text("\(i+1)")
                                        .modifier(F1Bold(size: 24))
                                        .frame(width: 40)
                                    
                                    Image("\(team.name)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 50)
                                    
                                    Text("\(team.name)")
                                        .modifier(F1Bold(size: 18))
                                        .frame(width: 170)
                                        .multilineTextAlignment(.leading)
                                    
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
                    } else {
                        Text("No standing")
                    }
                default: EmptyView()
            }
        }
        .padding(.horizontal, 5)
        .task {
            await apiModel.getTeamStandingsFor(sprint: sprint)
        }
        .onChange(of: sprint, perform: { value in
            Task.init {
                await apiModel.getTeamStandingsFor(sprint: value)
            }
        })
    }
}

struct TeamsStandingsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsStandingsView(sprint: Binding.constant(false))
            .environmentObject(F1ViewModel())
            .environmentObject(APIViewModel())
    }
}
