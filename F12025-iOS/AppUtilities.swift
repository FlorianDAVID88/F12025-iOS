//
//  AppUtilities.swift
//  F1 2025
//
//  Created by user234243 on 10/28/23.
//

import SwiftUI
import UIKit

final class AppUtility {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
