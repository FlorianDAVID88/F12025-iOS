//
//  AllPartnersView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/29/23.
//

import SwiftUI

struct AllPartnersView: View {
    @EnvironmentObject var apiModel: APIViewModel
    
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
                ForEach(Partner.TypePartner.allCases, id: \.self) { type in
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], alignment: .center, spacing: 25) {
                        let partenaires = apiModel.partners.filter { $0.type == type }
                        ForEach(partenaires, id: \.self.id_partner) { part in
                            NavigationLink(destination: PartnerView(partner: part)) {
                                Image(part.name)
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

struct AllPartnersView_Previews: PreviewProvider {
    static var previews: some View {
        AllPartnersView()
            .environmentObject(APIViewModel())
    }
}
