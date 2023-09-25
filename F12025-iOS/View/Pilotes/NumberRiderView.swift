//
//  NumberRiderView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/25/23.
//

import SwiftUI

struct NumberRider: ViewModifier {
    struct ColorAndFont {
        var color: Color
        var font: String
    }
    
    @State var pilot: Pilote
    @State var fontSize: Int
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(colorFont(team: pilot.team).color)
            .font(.custom(colorFont(team: pilot.team).font, size: CGFloat(fontSize)))
    }
    
    func colorFont(team: Ecurie) -> ColorAndFont {
        switch(team.nom_ecurie) {
        case "Alpine": return ColorAndFont(color: Color(red: 1, green: 0.498, blue: 1), font: "MTT Milano")
        case "Ferrari": return ColorAndFont(color: .red, font: "Akira Expanded")
        case "Red Bull": return ColorAndFont(color: .red, font: "Kanit")
        case "McLaren": return ColorAndFont(color: .black, font: "Space Grotesk")
        case "Audi": return ColorAndFont(color: .black, font: "Rubik")
        case "Mercedes": return ColorAndFont(color: .blue, font: "Century Gothic")
        case "Aston Martin": return ColorAndFont(color: Color(red: 0.2118, green: 0.5490, blue: 0.4627), font: "Rallington Sans 01")
        case "Hugo Boss": return ColorAndFont(color: .black, font: "SansSerifFLF")
        case "Williams": return ColorAndFont(color: .red, font: "Zebulon Condensed Hollow")
        case "Haas" : return ColorAndFont(color: .black, font: "Navy Cadet Super-Italic")
        default: return ColorAndFont(color: .purple, font: "Formula1-Display-Bold")
        }
    }
}

struct NumberRiderView: View {
    @State var pilot: Pilote
    @State var fontSize: Int
    
    var body: some View {
        Text("\(pilot.num_pilote)")
            .modifier(NumberRider(pilot: pilot, fontSize: fontSize))
    }
}

struct NumberRiderView_Previews: PreviewProvider {
    static var previews: some View {
        NumberRiderView(pilot: Pilote.allCases[3], fontSize: 30)
    }
}
