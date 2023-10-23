//
//  AllMonoplacesView.swift
//  F1 2025
//
//  Created by user234243 on 10/9/23.
//

import SwiftUI

struct AllMonoplacesView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    let monoplaces = Monoplace.allCases.sorted { $0.nom_monoplace < $1.nom_monoplace }
                    ForEach(monoplaces, id: \.self.id_monoplace) { car in
                        NavigationLink(destination: MonoplaceView(monoplace: car)) {
                            HStack {
                                ItemMonoplaceView(monoplace: car)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    
        .navigationTitle("Monoplaces 2025")
    }
}

struct AllMonoplacesView_Previews: PreviewProvider {
    static var previews: some View {
        AllMonoplacesView()
    }
}
