//
//  PartenaireView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/27/23.
//

import SwiftUI

struct PartenaireView: View {
    @State var partenaire: Partenaire
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                VStack {
                    Text(partenaire.nom_partenaire)
                        .font(.custom("Formula1-Display-Bold", size: 32))
                    Text(LocalizedStringKey(partenaire.type.rawValue))
                        .font(.custom("Formula1", size: 16))
                    
                    Image(partenaire.nom_partenaire)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                TextConcatURLView(nameText: partenaire.descriptif, url: partenaire.site.url, nameURL: partenaire.site.url_as)
                    .font(.custom("Formula1", size: 18))
                    .padding(.horizontal)
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct PartenaireView_Previews: PreviewProvider {
    static var previews: some View {
        PartenaireView(partenaire: Partenaire.allCases[2])
    }
}
