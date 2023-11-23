//
//  TeamView.swift
//  F1 2025
//
//  Created by Florian DAVID on 04/11/2023.
//

import SwiftUI

struct TeamView: View {
    @EnvironmentObject var apiModel: APIViewModel
    @State var team: Team
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Image(team.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding()
                    .border(Color.gray)
                
                Text(team.completeName)
                    .font(.custom("Formula1-Display-Bold", size: 32))
                
                HStack {
                    FlagView(pays: team.nationality, height: 25)
                    Text(LocalizedStringKey(team.nationality.name))
                        .font(.custom("Formula1", size: 16))
                }
            }
            
            VStack(alignment: .leading) {                
                Text("description_pilots".localized)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Formula1", size: 24))
                
                HStack {
                    switch apiModel.state {
                    case .success(let data):
                        if let pilotsTeam = data as? [Pilot] {
                            ForEach(pilotsTeam, id: \.self.id_pilot) { pilot in
                                NavigationLink(destination: PilotView(pilot: pilot)) {
                                    VStack {
                                        Image("\(pilot.name)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        
                                        HStack {
                                            NumberRiderView(pilot: pilot, fontSize: 20)
                                            
                                            FlagView(pays: pilot.nationality, height: 15)
                                            Text("\(pilot.name)")
                                                .modifier(F1Wide(size: 9))
                                        }
                                    }
                                }
                            }
                        } else {
                            Text("No pilots")
                        }
                    default: EmptyView()
                    }
                }
                .task {
                    await apiModel.getPilotsFromTeam(team: team)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle(Text("\(team.name)"), displayMode: .inline)
    }
}

#Preview {
    TeamView(team: Team(id_team: "", name: "Mercedes", completeName: "Mercedes F1", nationality: Country(id_country: "6541050682c016d52426f93b", name: "France"), points: 34, points_sprint: 18))
        .environmentObject(APIViewModel())
    
}
