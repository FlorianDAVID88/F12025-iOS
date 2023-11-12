//
//  F1Wide.swift
//  F1 2025
//
//  Created by Florian DAVID on 03/11/2023.
//

import SwiftUI

struct F1Wide: ViewModifier {
    @State var size: Int
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Formula1-Display-Wide", size: CGFloat(size)))
    }
}
