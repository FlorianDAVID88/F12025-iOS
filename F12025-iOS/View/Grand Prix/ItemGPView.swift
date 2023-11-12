//
//  ItemGPView.swift
//  F1 2025
//
//  Created by Florian DAVID on 05/11/2023.
//

import SwiftUI

struct ItemGPView: View {
    @State var gp: GrandPrix
    
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                FlagView(pays: gp.circuit.country, height: 35)
                Text("\(convertDate(gp.dateStart))\n\(convertDate(gp.dateFinish))")
                    .font(.custom("Formula1", size: 12))
                    .padding(5)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(LocalizedStringKey(gp.name))
                    .bold()
                    .font(.custom("Formula1-Display-Bold", size: 20))
                
                Text(gp.circuit.name)
                    .font(.custom("Formula1", size: 14))
                
            }
            .multilineTextAlignment(.leading)
        }
    }
    
    func convertDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        if let date = dateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "dd/MM"

            let formattedDate = outputDateFormatter.string(from: date)
            return formattedDate
        } else {
            print("Error date analyse")
            return ""
        }
    }
}

#Preview {
    ItemGPView(gp: GrandPrix(id_gp: "", name: "Grand Prix de France", circuit: GrandPrix.Circuit(name: "Circuit Paul Ricard", city: "", country: Country(id_country: "", name: "France")), dateStart: "12/09", dateFinish: "14/09", sprint: false, kmLap: 6.009, nbLaps: 60, nbTurns: 17, nbDRS: 2))
}
