//
//  LanguageViewModel.swift
//  F12025-iOS
//
//  Created by user234243 on 9/25/23.
//

import Foundation

class LanguageViewModel: ObservableObject {
    @Published var lang: String = "fr" // Défaut à la langue française
    
    func changeLanguage(to newLang: String) {
        lang = newLang
    }
}
