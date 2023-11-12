//
//  F1ViewModel.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/14/23.
//

import SwiftUI
import Foundation

class F1ViewModel: ObservableObject {
    func locationGoogleMaps(location: String) {
        if let encodedLocationName = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "https://www.google.com/maps/search/?q=\(encodedLocationName)") {
            UIApplication.shared.open(url)
        }
    }
}
