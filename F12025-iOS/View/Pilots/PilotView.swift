//
//  PilotView.swift
//  F1 2025
//
//  Created by Florian DAVID on 04/11/2023.
//

import SwiftUI

struct PilotView: View {
    @EnvironmentObject var apiModel: APIViewModel
    @State var pilot: Pilot
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(spacing: 15) {
                    Image(pilot.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                    
                    VStack {
                        NumberRiderView(pilot: pilot, fontSize: 48)
                        NavigationLink(destination: TeamView(team: pilot.team)) {
                            Image(pilot.team.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .padding(.horizontal)
                
                //VictoriesPilotView(pilot: pilot)
                //ResultsView(pilot: pilot)
            }
        }
        .navigationBarTitle(Text("\(pilot.name)"), displayMode: .inline)
        .navigationBarItems(trailing: FlagView(pays: pilot.nationality, height: 25))
    }
}

#Preview {
    PilotView(pilot: Pilot())
        .environmentObject(APIViewModel())
}
