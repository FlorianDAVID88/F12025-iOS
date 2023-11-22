//
//  AuthViewModel.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/28/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

enum StateAuth {
    case notAvailable
    case loading
    case success(data: Codable? = nil)
    case failed(error: Error)
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var currentUser: UserApp? = nil
    @Published var state: StateAuth = .notAvailable
    private let service: FirebaseAuthService
    
    init() {
        service = FirebaseAuthService()
        currentUser = getCurrentUser()
    }
    
    func isLogged() -> Bool {
        return self.currentUser != nil
    }
    
    private func getCurrentUser() -> UserApp? {
        if let storedData = UserDefaults.standard.data(forKey: "currentUser"),
           let decodedPerson = try? JSONDecoder().decode(UserApp.self, from: storedData) {
            return decodedPerson
        }
        return nil
    }
    
    private func setCurrentUser(user: UserApp?) {
        if let encodedData = try? JSONEncoder().encode(user) {
            DispatchQueue.main.async {
                UserDefaults.standard.set(encodedData, forKey: "currentUser")
            }
            self.currentUser = user
        }
    }
    
    func disconnect() {
        if self.currentUser != nil {
            self.state = .loading
            do {
                try Auth.auth().signOut()
                self.setCurrentUser(user: nil)
                self.state = .success()
            } catch let signOutError as NSError {
                self.state = .failed(error: signOutError)
                print("Erreur de déconnexion : \(signOutError)")
            }
        }
    }
    
    func signInWithEmail(email: String, password: String) {
        self.state = .loading
        
        service.signInWithEmail(email: email, password: password) { result in
            switch result {
                case .success(let user):
                    self.setCurrentUser(user: UserApp(from: user, connexion: "Email"))
                    self.state = .success()
                case .failure(let error):
                    self.state = .failed(error: error)
            }
        }
    }
    
    func signUpWithEmail(firstname: String, lastName: String, email: String, password: String) {
        self.state = .loading
        
        service.signUpWithEmail(username: "\(firstname) \(lastName)", email: email, password: password) { result in
            switch result {
                case .success(let user):
                    self.setCurrentUser(user: UserApp(from: user, connexion: "Email"))
                    self.state = .success()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.state = .failed(error: error)
            }
        }
    }
    
    /**
     * Connection with a certain social network (Apple, Google or Github)
     * @param rs the social network
     */
    func signWith(rs: String) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: AppUtility.rootViewController) { user, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            self.state = .loading
            switch(rs) {
                case "Apple": self.authApple()
                case "Google": self.authGoogle(user: user)
                case "GitHub": self.authGithub()
                default: return
            }
        }
    }
    
    private func authApple() {
        return
    }
    
    private func authGoogle(user: GIDSignInResult?) {
        service.signGoogle(user: user) { result in
            switch result {
                case .success(let userApp):
                    self.setCurrentUser(user: UserApp(from: userApp, connexion: "Google"))
                    self.state = .success()
                case .failure(let error):
                    self.state = .failed(error: error)
                    print(error.localizedDescription)
                }
        }
    }
    
    private func authGithub() {
        return
    }
    
    func change(name: String, email: String) {
        self.state = .loading
        do {
            if let user = try service.profileChanges(name: name, email: email) {
                self.setCurrentUser(user: UserApp(from: user, connexion: "Email"))
                self.state = .success()
            } else {
                self.state = .failed(error: FirebaseAuthError.userNotFound)
            }
        } catch {
            print(error.localizedDescription)
            self.state = .failed(error: error)
        }
    }
    
    func checkGoodPasswd(passwd: String, completion: @escaping () -> Void) {
        service.checkGoodPasswd(passwd: passwd) { error in
            if let error = error {
                self.state = .failed(error: error)
                print(error)
            } else {
                self.state = .success()
            }
            completion()
        }
    }
    
    func changePassword(current: String, new: String) {
        self.state = .loading
        service.changePassword(current: current, new: new) { result in
            switch result {
            case .success(let user):
                self.setCurrentUser(user: UserApp(from: user, connexion: "Email"))
                self.state = .success()
            case .failure(let error):
                self.state = .failed(error: error)
                print(error.localizedDescription)
            }
        }
    }
    
    func sendEmailResetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Erreur lors de la réinitialisation du mot de passe : \(error.localizedDescription)")
            } else {
                print("Email envoyé à \(email)")
            }
        }
    }
}
