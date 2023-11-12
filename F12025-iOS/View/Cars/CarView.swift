//
//  CarView.swift
//  F1 2025
//
//  Created by Florian DAVID on 07/11/2023.
//

import SwiftUI

struct CarView: View {
    @State var car: Car
    @State private var motorDetail = false
    @State private var bvDetail = false
    @State private var tyresDetail = false
    
    var body: some View {
        let team = car.team
        VStack {
            Image("\(team.name) - Monoplace")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Chassis : \(car.frame)")
                    Text("Poids : \(car.weight)kg")
                    DisclosureGroup("Moteur", isExpanded: $motorDetail) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Moteur \(car.engine.name), \(car.engine.configuration)")
                            Text("- Orientation : \(car.engine.orientation)")
                            Text("- Position : \(car.engine.position)")
                        }
                    }
                    
                    Text("Cylindrée : \(car.cylinder) cm3")
                    Text("Type : \(car.type)")
                    Text("Électronique : \(car.electronic)")
                    Text("Carburant : \(car.fuel)")

                    DisclosureGroup("Pneumatiques", isExpanded: $tyresDetail) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("- \(car.tyres[0].name) (\(car.tyres[0].type))")
                            Text("- \(car.tyres[1].name) (\(car.tyres[1].type))")
                            Text("tous montés sur des jantes \(car.wheels)")
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal)
        .multilineTextAlignment(.leading)
        .font(.custom("Formula1", size: 20))
        .navigationTitle("\(team.name) \(car.name)")
    }
}

#Preview {
    CarView(car: Car())
}
