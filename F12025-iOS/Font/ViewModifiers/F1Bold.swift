//
//  F1Bold.swift
//  F1 2025
//
//  Created by Florian DAVID on 03/11/2023.
//

import SwiftUI

struct F1Bold: ViewModifier {
    @State var size: Int
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Formula1-Display-Bold", size: CGFloat(size)))
    }
}
