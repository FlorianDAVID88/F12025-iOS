//
//  F1_RSView.swift
//  F1 2025
//
//  Created by user234243 on 10/2/23.
//

import SwiftUI

struct F1_RSView: View {
    var body: some View {
        VStack(spacing: 25) {
            ButtonRSView(name: "facebook", site: "https://www.facebook.com/Formula1", name_user: "F1")
            ButtonRSView(name: "twitter", site: "https://twitter.com/f1", name_user: "Formula 1")
            ButtonRSView(name: "instagram", site: "https://www.instagram.com/f1/", name_user: "FORMULA 1®")
            ButtonRSView(name: "youtube", site: "https://www.youtube.com/F1", name_user: "FORMULA 1")
        }
        .navigationBarTitle(LocalizedStringKey("Réseaux sociaux F1"), displayMode: .inline)
    }
    
    struct ButtonRSView: View {
        @State var name: String
        @State var site: String
        @State var name_user: String
        
        var body: some View {
            Button(action: {
                if let url = URL(string: site) {
                    UIApplication.shared.open(url)
                }
            }) {
                HStack {
                    Image(name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                    
                    Text(name_user)
                        .font(.custom("Formula1", size: 24))
                    
                    Spacer()
                }
                .foregroundColor(.primary)
                .frame(maxWidth: 240)
                .multilineTextAlignment(.leading)
            }
        }
    }
}

struct F1_RSView_Previews: PreviewProvider {
    static var previews: some View {
        F1_RSView()
    }
}
