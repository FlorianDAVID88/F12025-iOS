//
//  GraphCltPilotView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/26/23.
//

import SwiftUI

struct GraphCltPilotView: View {
    private var rankings: [Int] // Remplacez ces données par les vôtres
    
    init(pilote: Pilote) {
        var p = pilote
        self.rankings = p.getResultsGP()
    }
    
    var body: some View {
        ZStack {
            // Dessinez l'axe des x et des y
            Path { path in
                // Axe des y
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 220))
                
                // Axe des x
                path.move(to: CGPoint(x: 0, y: 220))
                path.addLine(to: CGPoint(x: 340, y: 220))
            }
            .stroke(Color.gray, lineWidth: 4)
            
            // Dessinez la ligne reliant les points
            Path { path in
                for (i, ranking) in rankings.enumerated() {
                    let xPosition = CGFloat(i) * 15 + 10
                    let yPosition = CGFloat(ranking) * 10 // Ajustez l'échelle si nécessaire
                    
                    if i == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    } else {
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
            }
            .stroke(Color.accentColor, lineWidth: 2)
            
            // Affichez tous les points et leurs valeurs
            ForEach(0..<rankings.count, id: \.self) { i in
                let xPosition = CGFloat(i) * 15 + 10
                let yPosition = CGFloat(rankings[i]) * 10 // Ajustez l'échelle si nécessaire
                var color: Color {
                    switch(rankings[i]) {
                        case 1 : return .yellow
                        case 2 : return .gray
                        case 3 : return .brown
                        default: return .primary
                    }
                }
                
                Circle()
                    .fill(Color.accentColor)
                    .frame(width: 8, height: 8)
                    .position(x: xPosition, y: yPosition)
                
                Text("\(rankings[i])")
                    .bold()
                    .position(x: xPosition, y: yPosition - 20)
                    .foregroundColor(color)
            }
            
            // Affichez les légendes des axes
            Text("Classement")
                .rotationEffect(.degrees(-90))
                .position(x: -15, y: 110)
            
            Text("Grand Prix")
                .position(x: UIScreen.main.bounds.width/2 - 20, y: 240)
            
            // Dessinez la grille
            ForEach(0..<rankings.count, id: \.self) { i in
                let xPosition = CGFloat(i) * 15 + 10
                let yPosition = CGFloat(i) * 10
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 340, height: 1)
                    .position(x: 170, y: yPosition)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 1, height: 220)
                    .position(x: xPosition, y: 110)
            }
        }
        .frame(width: 340, height: 240)
    }
}

struct GraphCltPilotView_Previews: PreviewProvider {
    static var previews: some View {
        GraphCltPilotView(pilote: Pilote.allCases[3])
    }
}
