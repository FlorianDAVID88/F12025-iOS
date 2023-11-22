//
//  SignInView.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/28/23.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct SignInView: View {
    @EnvironmentObject var signVM: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email: String = ""
    @State private var passwd: String = ""
    @State private var alertNonConnect = false
    @Binding var isShowingSignIn: Bool
    
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
            .modifier(F1Regular(size: 20))
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
                    .modifier(F1Bold(size: 20))
                    .foregroundColor(.white)
            }
            .alert(isPresented: $alertNonConnect) {
                Alert(title: Text("Impossible de se connecter !\nEmail ou mot de passe incorrect."))
            }
            
            HStack(spacing: 5) {
                Text("If you haven't an account, subscribe")
                Button {
                    withAnimation {
                        isShowingSignIn.toggle()
                    }
                } label: {
                    Text("here")
                        .underline()
                }
            }
            .modifier(F1Regular(size: 14))
            
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
                .modifier(F1Bold(size: 20))
                .foregroundColor(.white)
            }
        }
        .navigationBarTitle("Log in", displayMode: .inline)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(isShowingSignIn: Binding.constant(false))
            .environmentObject(AuthViewModel())
    }
}
