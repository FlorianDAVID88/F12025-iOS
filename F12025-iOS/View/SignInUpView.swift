//
//  SignInUpView.swift
//  F1 2025
//
//  Created by user234243 on 10/28/23.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct SignInUpView: View {
    @EnvironmentObject var signVM: SignUpViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme

    @State private var email: String = ""
    @State private var passwd: String = ""
    @State private var alertNonConnect = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image("f1")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .foregroundColor(.accentColor)

            VStack(spacing: 5) {
                TextField("Email or username", text: $email)
                    .padding(10)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(10)
                
                SecureField("Password", text: $passwd)
                    .padding(10)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(10)
            }
            .font(.custom("Formula1", size: 20))
            .foregroundColor(.accentColor)
            .padding(.horizontal)
            
            Button {
                signVM.signInWithEmail(email: email, password: passwd)
                if signVM.isLogged() { self.presentationMode.wrappedValue.dismiss() }
                else { alertNonConnect.toggle() }
            } label: {
                Text("Connexion")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .font(.custom("Formula1-Display-Bold", size: 20))
                    .foregroundColor(.white)
            }
            .alert(isPresented: $alertNonConnect) {
                Alert(title: Text("Impossible de se connecter !\nEmail ou mot de passe incorrect."))
            }
            
            Divider()
                .padding(.vertical)
            
            Button {
                signVM.signWith(rs: "Google")
                if signVM.isLogged() { self.presentationMode.wrappedValue.dismiss() }
            } label: {
                HStack {
                    Image("google-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                    Text("Sign in with Google")
                }
                .padding()
                .background(.blue)
                .cornerRadius(10)
                .font(.custom("Formula1-Display-Bold", size: 20))
                .foregroundColor(.white)
            }
        }
    }
}

struct SignInUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignInUpView()
            .environmentObject(SignUpViewModel())
    }
}
