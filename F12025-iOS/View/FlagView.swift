//
//  FlagView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import SwiftUI

struct FlagView: View {
    @State var pays: Pays
    @State var height: Int
    
    var body: some View {
        if height < 35 {
            Image(pays.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: CGFloat(height))
                .clipShape(RoundedRectangle(cornerRadius: 5))
        } else {
            Image(pays.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: CGFloat(height))
                .clipShape(RoundedRectangle(cornerRadius: CGFloat(height/10)))
                .overlay(
                    RoundedRectangle(cornerRadius: CGFloat(height/10))
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.gray]), startPoint: .top, endPoint: .bottom), lineWidth: 5)
                        .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                    
                )
        }
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(pays: .AFS, height: 25)
    }
}
