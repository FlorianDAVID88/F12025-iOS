//
//  CaractCircuitView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/19/23.
//

import SwiftUI

struct CaractCircuitView: View {
    @State var caract: String
    @State var content: String
    @State var unity: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(caract)
                .font(.custom("Formula1", size: 16))
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text(content)
                    .font(.custom("Formula1-Display-Bold", size: 30))
                
                Text(unity)
                    .font(.custom("Formula1", size: 14))
            }
        }
        .multilineTextAlignment(.leading)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                .shadow(color: Color.primary, radius: 10, x: 10, y: 10)
        )
    }
}

struct CaractCircuitView_Previews: PreviewProvider {
    static var previews: some View {
        CaractCircuitView(caract: "Total distance", content: "000.000", unity: "km")
    }
}