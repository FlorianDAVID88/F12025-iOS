//
//  AllCarsView.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/9/23.
//

import SwiftUI

struct AllCarsView: View {
    @EnvironmentObject var apiModel: APIViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    let cars = apiModel.cars.sorted { $0.name < $1.name }
                    ForEach(cars, id: \.self.id_car) { car in
                        NavigationLink(destination: CarView(car: car)) {
                            HStack {
                                ItemCarView(car: car)
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

struct AllCarsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCarsView()
            .environmentObject(APIViewModel())
    }
}
