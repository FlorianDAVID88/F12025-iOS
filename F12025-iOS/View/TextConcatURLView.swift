//
//  TextConcatButtonURLView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/29/23.
//

import SwiftUI

struct TextConcatURLView: View {
    @State var nameText: String
    @State var url: String
    @State var nameURL: String
    
    var body: some View {
        Text(nameText)
            + Text(.init("[\(nameURL)](\(url))"))
                .foregroundColor(.accentColor)
                .underline()
    }
}

struct TextConcatButtonURLView_Previews: PreviewProvider {
    static var previews: some View {
        TextConcatURLView(nameText: "zhieskjifodkm", url: "", nameURL: "for.for")
    }
}
