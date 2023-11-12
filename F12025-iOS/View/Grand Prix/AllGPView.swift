//
//  AllGPView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/14/23.
//

import SwiftUI

struct AllGPView: View {
    @EnvironmentObject var apiModel: APIViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                ForEach(apiModel.allGPs, id: \.self.id_gp) { gp in
                    NavigationLink(destination: GPView(gp: gp)) {
                        HStack {
                            ItemGPView(gp: gp)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .foregroundColor(.primary)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct AllGPView_Previews: PreviewProvider {
    static var previews: some View {
        AllGPView()
            .environmentObject(APIViewModel())
    }
}
