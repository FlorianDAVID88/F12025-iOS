//
//  AllGPView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import SwiftUI

struct AllGPView: View {
    @EnvironmentObject var viewModel: F1ViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                ForEach(viewModel.all_gp, id: \.self.id_gp) { gp in
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
            .environmentObject(F1ViewModel())
    }
}
