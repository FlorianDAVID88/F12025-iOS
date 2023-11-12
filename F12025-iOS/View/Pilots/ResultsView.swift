//
//  ResultsPilotView.swift
//  F1 2025
//
//  Created by Florian DAVID on 11/11/2023.
//

import SwiftUI

struct ResultsView: View {
    @State var results: [ResultCourse]
    
    var body: some View {
        List {
            ForEach(results, id: \.self.id_result) { result in
                HStack(alignment: .center) {
                    Text(result.gp.name)
                        .modifier(F1Regular(size: 16))
                    
                    Spacer()
                    
                    if result.bestLap {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(3)
                            .background(Color.accentColor)
                            .cornerRadius(5)
                    }
                    
                    getPosition(position: result.position)
                        .modifier(F1Bold(size: 24))

                }
            }
        }
        .listStyle(.plain)
    }
    
    func getPosition(position: Int) -> some View {
        let color: Color
        let exponent: String
        
        switch(position) {
            case 1:
                color = .yellow
                exponent = "st"
            case 2:
                color = .gray
                exponent = "nd"
            case 3:
                color = .brown
                exponent = "rd"
            default:
                color = .primary
                exponent = "th"
        }
        
        return Text("\(position)")
                    .foregroundColor(color)
                + Text(exponent.localized)
                    .baselineOffset(10)
                    .foregroundColor(color)
    }
}

#Preview {
    ResultsView(results: [
        ResultCourse(id_result: "", name_result: "", isSprint: false, pilot: Pilot(), gp: GrandPrix(id_gp: "", name: "Grand Prix de France", circuit: GrandPrix.Circuit(name: "Circuit de Nevers-Magny-Cours", city: "Nevers", country: Country(id_country: "", name: "France")), dateStart: "27/06", dateFinish: "29/06", sprint: false, kmLap: 6.098, nbLaps: 65, nbTurns: 17, nbDRS: 3), position: 3, points: 15, bestLap: true),
        ResultCourse(id_result: "", name_result: "", isSprint: false, pilot: Pilot(), gp: GrandPrix(id_gp: "", name: "Grand Prix de France", circuit: GrandPrix.Circuit(name: "Circuit de Nevers-Magny-Cours", city: "Nevers", country: Country(id_country: "", name: "France")), dateStart: "27/06", dateFinish: "29/06", sprint: false, kmLap: 6.098, nbLaps: 65, nbTurns: 17, nbDRS: 3), position: 1, points: 25, bestLap: false)
    ])
}
