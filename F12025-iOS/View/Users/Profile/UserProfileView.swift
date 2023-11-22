//
//  UserProfileView.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/28/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserProfileView: View {
    @EnvironmentObject var signVM: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var alertDisconnect: Bool = false
    @State private var alertCheckPasswd: Bool = false
    @State private var changePasswd: Bool = false
    
    @State private var passwd = ""
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    @State private var userPN: String = ""
    
    
    private var keyboardNotification = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true }
        .merge(with: NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
        )
        .eraseToAnyPublisher()
    
    var body: some View {
        if let user = signVM.currentUser {
            VStack(spacing: 20) {
                HStack(spacing: 15) {
                    VStack {
                        Text(userName)
                            .modifier(F1Bold(size: 24))
                        
                        Text(userEmail)
                            .modifier(F1Regular(size: 16))
                    }
                    
                    if user.photoURL != nil {
                        WebImage(url: user.photoURL)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    }
                }
                
                HStack {
                    Text("Connecté via \(user.connexion)")
                    Image("\(user.connexion.lowercased())-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                }
                
                List {
                    if user.connexion == "Email" {
                        ItemProfileView(nameText: "Nom", text: $userName)
                            .onReceive(keyboardNotification) { isVisible in
                                if !isVisible {
                                    signVM.change(name: userName, email: userEmail)
                                }
                            }
                        
                        ItemProfileView(nameText: "Email", text: $userEmail)
                            .onReceive(keyboardNotification) { isVisible in
                                if !isVisible {
                                    signVM.change(name: userName, email: userEmail)
                                }
                            }
                        
                        ItemProfileView(nameText: "Téléphone", text: $userPN)
                        
                        Spacer()
                        Button {
                            alertCheckPasswd.toggle()
                        } label: {
                            HStack {
                                Text("Change password")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .alert("Password changing", isPresented: $alertCheckPasswd) {
                            SecureField("Password", text: $passwd)
                            Button("OK", action: {
                                signVM.checkGoodPasswd(passwd: passwd) {
                                    print(signVM.state)
                                    switch signVM.state {
                                        case .success(_):
                                            alertCheckPasswd = false
                                            changePasswd = true
                                            
                                        case .failed(_): alertCheckPasswd = true
                                        default: break
                                    }
                                }
                            })
                        }
                    } else {
                        ItemProfileView(nameText: "Nom", text: .constant(user.name))
                        ItemProfileView(nameText: "Email", text: .constant(user.email))
                        ItemProfileView(nameText: "Téléphone", text: .constant(user.phoneNumber))
                    }
                }
                .modifier(F1Regular(size: 20))
                .listStyle(.plain)
                
            }
            
            Spacer()
            
            Button {
                alertDisconnect.toggle()
            } label: {
                Text("Se déconnecter")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .font(.custom("Formula1-Display-Bold", size: 20))
                    .foregroundColor(.white)
            }
            .alert(isPresented: $alertDisconnect) {
                Alert(
                    title: Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
                    primaryButton: .default(Text("Oui"), action: {
                        signVM.disconnect()
                        if !signVM.isLogged() { self.presentationMode.wrappedValue.dismiss() }
                    }),
                    secondaryButton: .cancel(Text("Non"), action: {
                        alertDisconnect = false
                    }))
            }
            .navigationBarTitle("\(userName) - Profil", displayMode: .inline)
            .onAppear {
                userName = user.name
                userEmail = user.email
                userPN = user.phoneNumber
            }
            .sheet(isPresented: $changePasswd, content: {
                ChangePasswdView(change: $changePasswd, current: $passwd)
            })
        } else {
            EmptyView()
        }
    }
}

#Preview {
    UserProfileView()
        .environmentObject(AuthViewModel())
}
