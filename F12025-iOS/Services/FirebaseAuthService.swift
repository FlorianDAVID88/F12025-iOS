//
//  FirebaseAuthService.swift
//  F1 2025
//
//  Created by Florian DAVID on 20/11/2023.
//

import Firebase
import Foundation
import GoogleSignIn

enum FirebaseAuthError: Error {
    case userNotFound
    case authentificationError(error: String)
    case emailNotSent
    case updateError(for: String)
    case credentialError
}

struct FirebaseAuthService {
    /**
     * Connexion with email
     * @param email: user email
     * @param password: user password
     */
    func signInWithEmail(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            if let err = error {
                completion(.failure(FirebaseAuthError.authentificationError(error: err.localizedDescription)))
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(FirebaseAuthError.userNotFound))
                return
            }
            
            completion(.success(user))
        }
    }
    
    /**
     * User account creation
     * @param email: user email
     * @param password: user password
     */
    func signUpWithEmail(username: String, email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let err = error {
                completion(.failure(FirebaseAuthError.authentificationError(error: err.localizedDescription)))
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(FirebaseAuthError.userNotFound))
                return
            }
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges { (error) in
                if error != nil {
                    completion(.failure(FirebaseAuthError.updateError(for: "Username signup")))
                    return
                }
                
                completion(.success(user))
            }
        }
    }
    
    /**
     * Connection with Google
     * @param user: the user who wants to connect
     */
    func signGoogle(user: GIDSignInResult?, completion: @escaping (Result<User, Error>) -> Void) {
        guard
            let user = user?.user,
            let idToken = user.idToken
        else {
            completion(.failure(FirebaseAuthError.userNotFound))
            return
        }
        
        let accessToken = user.accessToken
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
        
        Auth.auth().signIn(with: credential) { result, error in
            if let err = error {
                completion(.failure(FirebaseAuthError.authentificationError(error: err.localizedDescription)))
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(FirebaseAuthError.userNotFound))
                return
            }
            
            completion(.success(user))
        }
    }
    
    /**
     * Connexion with GitHub
     */
    func signGitHub(completion: @escaping (Result<User, Error>) -> Void) {
        let provider = OAuthProvider(providerID: "github.com")
        provider.customParameters = ["allow_signup": "false"]
        provider.scopes = ["user:email"]
        
        provider.getCredentialWith(nil) { authCredential, error in
            if error != nil {
                completion(.failure(FirebaseAuthError.credentialError))
                return
            }
            
            guard let token = (authCredential as? OAuthCredential)?.accessToken else {
                completion(.failure(FirebaseAuthError.credentialError))
                return
            }
            
            let credential = GitHubAuthProvider.credential(withToken: token)
            Auth.auth().signIn(with: credential) { result, error in
                if let err = error {
                    completion(.failure(FirebaseAuthError.authentificationError(error: err.localizedDescription)))
                    return
                }
                
                guard let user = result?.user else {
                    completion(.failure(FirebaseAuthError.userNotFound))
                    return
                }
                
                completion(.success(user))
            }
        }
    }
    
    func profileChanges(name: String, email: String) throws -> User? {
        var changeError: Error?
        
        if let user = Auth.auth().currentUser {
            if user.displayName != name {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("Erreur updating name : \(error.localizedDescription)")
                        changeError = FirebaseAuthError.updateError(for: "Username")
                        return
                    } else {
                        print("Profile name updated successfully")
                    }
                }
            }
            
            if user.email != email {
                user.updateEmail(to: email) { error in
                    if let error = error {
                        print("Error updating email : \(error.localizedDescription)")
                        changeError = FirebaseAuthError.updateError(for: "Email")
                    } else {
                        print("Email updated successfully")
                    }
                }
            }
        }
        
        if let error = changeError {
            throw error
        }
        
        return Auth.auth().currentUser
    }
    
    func checkGoodPasswd(passwd: String, completion: @escaping (Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(FirebaseAuthError.userNotFound)
            return
        }
        
        let email = user.email ?? ""
        let credential = EmailAuthProvider.credential(withEmail: email, password: passwd)
        
        user.reauthenticate(with: credential) { _, error in
            if let error = error {
                completion(FirebaseAuthError.authentificationError(error: error.localizedDescription))
            } else {
                completion(nil)
            }
        }
    }
    
    func changePassword(current: String, new: String, completion: @escaping (Result<User, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(FirebaseAuthError.userNotFound))
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: user.email!, password: current)
        user.reauthenticate(with: credential) { _, error in
            if let error = error {
                completion(.failure(FirebaseAuthError.authentificationError(error: error.localizedDescription)))
                return
            }
            
            user.updatePassword(to: new) { error in
                if error != nil {
                    completion(.failure(FirebaseAuthError.updateError(for: "Password")))
                    return
                } else {
                    completion(.success(user))
                }
            }
        }
    }
}
