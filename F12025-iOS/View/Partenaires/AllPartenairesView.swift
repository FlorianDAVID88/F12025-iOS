//
//  AllPartenairesView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/29/23.
//

import SwiftUI

struct AllPartenairesView: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 10) {
                Image("f1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
                    .foregroundColor(.accentColor)

                Text("Nos partenaires")
                    .font(.custom("Formula1-Display-Bold", size: 24))
            }
            
            VStack(alignment: .center) {
                ForEach(TypePartenaire.allCases, id: \.self) { type in
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], alignment: .center, spacing: 25) {
                        let partenaires = Partenaire.allCases.filter { $0.type == type }
                        ForEach(partenaires, id: \.self.id_partenaire) { part in
                            NavigationLink(destination: PartenaireView(partenaire: part)) {
                                Image(part.nom_partenaire)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                }
            }
        }
    }
}

struct AllPartenairesView_Previews: PreviewProvider {
    static var previews: some View {
        AllPartenairesView()
    }
}
