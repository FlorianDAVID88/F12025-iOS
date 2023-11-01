//
//  LogInViewModel.swift
//  F1 2025
//
//  Created by user234243 on 10/28/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

class SignUpViewModel: ObservableObject {
    @Published var currentUser: UserApp? = nil
    
    init() {
        currentUser = getCurrentUser()
    }
    
    func isLogged() -> Bool {
        return self.currentUser != nil
    }
    
    func disconnect() {
        if self.currentUser != nil {
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print("Erreur de déconnexion : \(signOutError)")
            }
            setCurrentUser(user: nil)
        }
    }
    
    private func getCurrentUser() -> UserApp? {
        if let storedData = UserDefaults.standard.data(forKey: "currentUser"),
           let decodedPerson = try? JSONDecoder().decode(UserApp.self, from: storedData) {
            return decodedPerson
        }
        return nil
    }
    
    func setCurrentUser(user: UserApp?) {
        if let encodedData = try? JSONEncoder().encode(user) {
            DispatchQueue.main.async {
                UserDefaults.standard.set(encodedData, forKey: "currentUser")
            }
            self.currentUser = user
        }
    }
    
    func signInWithEmail(email: String, password: String) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.setCurrentUser(user: UserApp(from: user, connexion: "Email"))
        }
    }
    
    func signUpWithEmail(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.setCurrentUser(user: UserApp(from: user, connexion: "Email"))
        }
    }
    
    func signWith(rs: String) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        //Configuration object Google sign in
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        //Sign in
        GIDSignIn.sharedInstance.signIn(withPresenting: AppUtility.rootViewController) { user, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            switch(rs) {
                case "Apple": return
                case "Google": self.signUpGoogle(user: user)
                case "Microsoft": return
                case "Email": return
                default: return
            }
        }
    }
    
    private func signUpGoogle(user: GIDSignInResult?) {
        guard
            let user = user?.user,
            let idToken = user.idToken
        else { return }
        
        let accessToken = user.accessToken
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
        
        Auth.auth().signIn(with: credential) { result, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.setCurrentUser(user: UserApp(from: user, connexion: "Google"))
        }
    }
}
