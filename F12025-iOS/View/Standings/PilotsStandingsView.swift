//
//  PilotsStandingsView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/16/23.
//

import SwiftUI

struct PilotsStandingsView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    @EnvironmentObject var apiModel: APIViewModel
    @Binding var sprint: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                let pilots = apiModel.pilots.sorted(by: {
                    if sprint {
                        return $0.points_sprint > $1.points_sprint
                    } else {
                        return $0.points > $1.points
                    }
                })
                ForEach(pilots.indices, id: \.self) { i in
                    let pilot = pilots[i]
                    NavigationLink(destination: PilotView(pilot: pilot)) {
                        HStack {
                            Text("\(i+1)")
                                .modifier(F1Bold(size: 24))
                                .frame(width: 40)
                            
                            Image("\(pilot.name)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                            
                            Text("\(pilot.name)")
                                .modifier(F1Bold(size: 18))
                                .frame(width: 220)
                                .multilineTextAlignment(.leading)
                            
                            Text("\(sprint ? pilot.points_sprint : pilot.points) pts".uppercased())
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
        }
    }
}

struct PilotsStandingsView_Previews: PreviewProvider {
    static var previews: some View {
        PilotsStandingsView(sprint: Binding.constant(false))
            .environmentObject(F1ViewModel())
            .environmentObject(APIViewModel())
    }
}
