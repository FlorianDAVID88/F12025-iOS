//
//  StandingsView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/13/23.
//

import SwiftUI

struct StandingsView: View {
    @State private var clt: Int = 0
    @State private var sprint: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(LocalizedStringKey("Classements")) + Text(" :")
                    .font(.custom("Formula1", size: 20))
                
                Picker("Classement", selection: $clt) {
                    Text("Pilotes")
                        .tag(0)
                    
                    Text("Constructeurs")
                        .tag(1)
                }
                
                Picker("Type", selection: $sprint) {
                    Text("Général")
                        .tag(false)
                    
                    Text("Sprint")
                        .tag(true)
                }
            }
            
            ScrollView {
                if clt == 0 {
                    PilotsStandingsView(sprint: $sprint)
                        .padding(.horizontal)
                } else {
                    TeamsStandingsView(sprint: $sprint)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
    }
}
