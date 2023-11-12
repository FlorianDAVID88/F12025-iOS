//
//  PartnerView.swift
//  F1 2025
//
//  Created by Florian DAVID on 07/11/2023.
//

import SwiftUI

struct PartnerView: View {
    @State var partner: Partner
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                VStack {
                    Text(partner.name)
                        .font(.custom("Formula1-Display-Bold", size: 32))
                    Text(LocalizedStringKey(partner.type.rawValue))
                        .font(.custom("Formula1", size: 16))
                    
                    Image(partner.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                TextConcatURLView(nameText: "\(partner.name)_desc".localized, url: partner.site.url, nameURL: partner.site.url_as)
                    .font(.custom("Formula1", size: 18))
                    .padding(.horizontal)
            }
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PartnerView(partner: Partner(id_partner: "", name: "", type: Partner.TypePartner.Mondial, site: Partner.Website(name: "", url: "", url_as: "")))
}
