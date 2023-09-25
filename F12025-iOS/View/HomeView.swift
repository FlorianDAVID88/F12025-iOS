//
//  HomeView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import Localize_Swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("f1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50)
            
            Text("Les temps morts ? Pas de temps pour cela. Un grand match ? Nous en faisons 23 par an. Ce n'est pas un sport ordinaire. C'est la Formule 1.")
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .font(Font.custom("Formula1", size: 20))
            
            HStack {
                Text("Pour en savoir plus, consulter le site : ")
                Button(action: {
                    // Ouvrir le lien web lorsque le bouton est tapé
                    if let url = URL(string: "https://www.formula1.com/") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("formula1.com")
                        .foregroundColor(.accentColor)
                        .underline()
                }
            }
            .font(Font.custom("Formula1", size: 14))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
