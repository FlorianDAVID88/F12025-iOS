//
//  SliderSignView.swift
//  F1 2025
//
//  Created by Florian DAVID on 03/11/2023.
//

import SwiftUI

struct SliderSignView: View {
    @State private var isShowingSignIn = true
    
    var body: some View {
        if isShowingSignIn {
            SignInView(isShowingSignIn: $isShowingSignIn)
                .transition(.move(edge: .trailing))
        } else {
            SignUpView(isShowingSignIn: $isShowingSignIn)
                .transition(.move(edge: .trailing))
        }
    }
}

#Preview {
    SliderSignView()
}
