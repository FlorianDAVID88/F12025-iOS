//
//  Extensions.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/2/23.
//

import Foundation
import SwiftUI

extension String {
    static func localizedString(for key: String, locale: Locale = .current) -> String {
        let localizationFiles = ["AppLocalizable", "Car", "Countries", "Partners", "GrandPrix"]
        let lang = locale.language.languageCode?.identifier
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        
        for file in localizationFiles {
            let localizedString = NSLocalizedString(key, tableName: file, bundle: bundle, comment: "")
            if (localizedString != key) {
                return localizedString
            }
        }
        
        return key
    }
    
    var localized: String {
        return .localizedString(for: self)
    }
}
