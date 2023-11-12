//
//  ItemCarView.swift
//  F1 2025
//
//  Created by Florian DAVID on 07/11/2023.
//

import SwiftUI

struct ItemCarView: View {
    @State var car: Car
    
    var body: some View {
        HStack(spacing: 20) {
            let team = car.team
            Image("\(team.name) - Monoplace")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width/3)

            VStack(alignment: .leading) {
                Text("\(team.name) \(car.name)")
                    .font(.custom("Formula1-Display-Bold", size: 20))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                
                FlagView(pays: team.nationality, height: 20)
            }
        }
    }
}

#Preview {
    ItemCarView(car: Car())
}
