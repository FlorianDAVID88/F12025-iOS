//
//  ResultsPilotView.swift
//  F1 2025
//
//  Created by Florian DAVID on 11/11/2023.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var apiModel: APIViewModel
    @State var pilot: Pilot
    
    var body: some View {
        VStack {
            Text("Results".localized)
                .font(.custom("Formula1", size: 24))
            
            switch apiModel.state {
                case .success(let data):
                    if let results = data as? [ResultCourse] {
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
                    } else {
                        Text("No results for \(pilot.name)")
                    }
                default: EmptyView()
            }
        }
        .task {
            await apiModel.getResultsFromPilot(pilot: pilot)
        }
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
    ResultsView(pilot: Pilot())
        .environmentObject(APIViewModel())
}
