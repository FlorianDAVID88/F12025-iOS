//
//  F1ViewModel.swift
//  F12025-iOS
//
//  Created by user234243 on 9/14/23.
//

import Foundation

class F1ViewModel: ObservableObject {
    @Published var pilotes: [Pilote] = Pilote.allCases
    @Published var circuits: [GrandPrix] = GrandPrix.allCases
    
    
}
