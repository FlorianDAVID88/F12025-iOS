//
//  FlagView.swift
//  F1 2025
//
//  Created by Florian DAVID on 04/11/2023.
//

import SwiftUI

struct FlagView: View {
    @State var pays: Country
    @State var height: Int
    
    var body: some View {
        if height < 35 {
            Image(pays.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: CGFloat(height))
                .clipShape(RoundedRectangle(cornerRadius: 5))
        } else {
            Image(pays.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: CGFloat(height))
                .clipShape(RoundedRectangle(cornerRadius: CGFloat(height/10)))
                .overlay(
                    RoundedRectangle(cornerRadius: CGFloat(height/10))
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.gray]), startPoint: .top, endPoint: .bottom), lineWidth: 5)
                        .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                    
                )
        }
    }
}

#Preview {
    FlagView(pays: Country(id_country: "6541050682c016d52426f93b", name: "France"), height: 30)
}
