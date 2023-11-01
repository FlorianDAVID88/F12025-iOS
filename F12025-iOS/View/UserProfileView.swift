//
//  UserProfileView.swift
//  F1 2025
//
//  Created by user234243 on 10/28/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserProfileView: View {
    @EnvironmentObject var signVM: SignUpViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var alert: Bool = false
    
    var body: some View {
        if let user = signVM.currentUser {
            VStack(spacing: 20) {
                HStack(spacing: 15) {
                    VStack {
                        Text(user.name)
                            .font(.custom("Formula1-Display-Bold", size: 24))
                        
                        Text(user.email)
                            .font(.custom("Formula1", size: 16))
                    }
                    
                    if user.photoURL != nil {
                        WebImage(url: user.photoURL)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .cornerRadius(50)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    }
                }
                
                if user.connexion != "Email" {
                    HStack {
                        Text("Connecté via \(user.connexion)")
                        Image("\(user.connexion.lowercased())-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                    Spacer()
                } else {
                    
                }
                
                Button {
                    alert.toggle()
                } label: {
                    Text("Se déconnecter")
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .font(.custom("Formula1-Display-Bold", size: 20))
                        .foregroundColor(.white)
                }
                .alert(isPresented: $alert) {
                    Alert(
                        title: Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
                        primaryButton: .default(Text("Oui"), action: {
                            signVM.disconnect()
                            if !signVM.isLogged() { self.presentationMode.wrappedValue.dismiss() }
                        }),
                        secondaryButton: .cancel(Text("Non"), action: {
                            alert = false
                        }))
                }
            }
            .navigationBarTitle("\(user.name) - Profil", displayMode: .inline)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .environmentObject(SignUpViewModel())
    }
}
