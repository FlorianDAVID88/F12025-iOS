//
//  UserApp.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/28/23.
//

import Foundation
import Firebase
import GoogleSignIn

/**
 * Class based on the FIRUser structure
 * Purpose : to facilitate its encoding so that it can be stored in UserDefaults
 */
struct UserApp: Codable {
    var id: String
    var name: String
    var email: String
    var phoneNumber: String
    var photoURL: URL?
    var isAnonymous: Bool
    var isEmailVerified: Bool
    var connexion: String       // The connexion method (Apple, Google or GitHub)
    
    init(from user: User, connexion: String) {
        self.id = user.uid
        self.name = user.displayName ?? "User"
        self.email = user.email ?? ""
        self.phoneNumber = user.phoneNumber ?? "No"
        self.photoURL = user.photoURL
        self.isAnonymous = user.isAnonymous
        self.isEmailVerified = user.isEmailVerified
        self.connexion = connexion
    }
}
