//
//  IntroductionView.swift
//  F1 2025
//
//  Created by Florian DAVID on 16/11/2023.
//

import SwiftUI

struct IntroductionView: View {
    @State private var isActive: Bool = false

    var body: some View {
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            VStack {
                Image("f1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding()
                
                Image("2025-F1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            }
            .foregroundColor(.white)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isActive = true
                }
            }
        }
        .opacity(isActive ? 0 : 1)
    }
}

#Preview {
    IntroductionView()
}
