//
//  HomeView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/13/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 15) {
                Image("f1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Image("2025-F1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
            }
            .foregroundColor(.accentColor)

            Text("app_description".localized)
                .modifier(F1Regular(size: 22))

            TextConcatURLView(nameText: "find_more_info".localized, url: "https://www.formula1.com/", nameURL: "formula1.com")
                .modifier(F1Regular(size: 16))
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
