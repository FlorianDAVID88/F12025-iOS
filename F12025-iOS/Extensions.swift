//
//  Extensions.swift
//  F1 2025
//
//  Created by user234243 on 10/2/23.
//

import Foundation
import SwiftUI

extension String {
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {

        let path = Bundle.main.path(forResource: locale.languageCode, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey ?? "", locale: locale)
    }
    
    var stringKey: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
}
