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
                switch apiModel.state {
                    case .success(let data):
                        if let cars = data as? [Car] {
                            VStack(alignment: .leading, spacing: 15) {
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
                    default: EmptyView()
                }
            }
        }
        .navigationTitle("Monoplaces 2025".localized)
        .task {
            await apiModel.getAllCars()
        }
    }
}

struct AllCarsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCarsView()
            .environmentObject(APIViewModel())
    }
}
