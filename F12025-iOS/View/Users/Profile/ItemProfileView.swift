//
//  ItemProfileView.swift
//  F1 2025
//
//  Created by Florian DAVID on 14/11/2023.
//

import SwiftUI

struct ItemProfileView: View {
    @State var nameText: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(nameText)
            Spacer()
            TextEditor(text: $text)
                .frame(height: 35)
                .multilineTextAlignment(.trailing)
                .modifier(F1Regular(size: 20))
        }
    }
}

#Preview {
    ItemProfileView(nameText: "While", text: Binding.constant(""))
}
