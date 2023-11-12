//
//  ItemTeamView.swift
//  F1 2025
//
//  Created by Florian DAVID on 04/11/2023.
//

import SwiftUI

struct ItemTeamView: View {
    @EnvironmentObject var apiModel: APIViewModel
    @State var team: Team
    
    var body: some View {
        HStack(spacing: 20) {
            Image(team.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(team.completeName)
                    .font(.custom("Formula1-Display-Bold", size: 20))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                
                Image(team.nationality.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: CGFloat(20))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
        
    }
}

#Preview {
    ItemTeamView(team: Team(id_team: "", name: "Mercedes", completeName: "Mercedes F1", nationality: Country(id_country: "6541050682c016d52426f93b", name: "France"), points: 34, points_sprint: 18))
        .environmentObject(APIViewModel())
}
