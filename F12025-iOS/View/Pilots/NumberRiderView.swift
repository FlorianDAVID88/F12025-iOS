//
//  NumberRiderView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/25/23.
//

import SwiftUI

struct NumberRider: ViewModifier {
    @State var pilot: Pilot
    @State var fontSize: Int
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(colorFont(team: pilot.team).color)
            .font(.custom(colorFont(team: pilot.team).font, size: CGFloat(fontSize)))
    }
    
    func colorFont(team: Team) -> ColorAndFont {
        switch(team.name) {
            case "Alpine": return ColorAndFont(color: Color(red: 1, green: 0.498, blue: 1), font: "MTT Milano")
            case "Ferrari": return ColorAndFont(color: .red, font: "Akira Expanded")
            case "Red Bull": return ColorAndFont(color: .red, font: "Kanit")
            case "McLaren": return ColorAndFont(color: .primary, font: "Space Grotesk")
            case "Audi": return ColorAndFont(color: .primary, font: "Rubik")
            case "Mercedes": return ColorAndFont(color: .blue, font: "Century Gothic")
            case "Aston Martin": return ColorAndFont(color: Color(red: 0.2118, green: 0.5490, blue: 0.4627), font: "Rallington Sans 01")
            case "Hugo Boss": return ColorAndFont(color: .primary, font: "SansSerifFLF")
            case "Williams": return ColorAndFont(color: .red, font: "Zebulon Condensed Hollow")
            case "Haas" : return ColorAndFont(color: .primary, font: "Navy Cadet Super-Italic")
            default: return ColorAndFont(color: .purple, font: "Formula1-Display-Bold")
        }
    }
    
    struct ColorAndFont {
        var color: Color
        var font: String
    }
}

struct NumberRiderView: View {
    @State var pilot: Pilot
    @State var fontSize: Int
    
    var body: some View {
        Text("\(pilot.num_pilot)")
            .modifier(NumberRider(pilot: pilot, fontSize: fontSize))
    }
}

struct NumberRiderView_Previews: PreviewProvider {
    static var previews: some View {
        NumberRiderView(pilot: Pilot(), fontSize: 30)
    }
}
