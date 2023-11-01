//
//  HomeView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("f1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 30)
                .foregroundColor(.accentColor)

            Text("app_description")
                .font(Font.custom("Formula1", size: 22))
            
            TextConcatURLView(nameText: "find_more_info", url: "https://www.formula1.com/", nameURL: "formula1.com")
                .font(Font.custom("Formula1", size: 16))
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
