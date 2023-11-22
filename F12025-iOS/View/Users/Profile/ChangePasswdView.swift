//
//  ChangePasswdView.swift
//  F1 2025
//
//  Created by Florian DAVID on 22/11/2023.
//

import SwiftUI

struct ChangePasswdView: View {
    @EnvironmentObject var signVM: AuthViewModel
    @Binding var change: Bool
    @Binding var current: String
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Image("f1")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .foregroundColor(.accentColor)
            
            VStack(spacing: 5) {
                SecureField("New Password", text: $newPassword)
                    .padding(10)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(10)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding(10)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(10)
            }
            .modifier(F1Regular(size: 20))
            .foregroundColor(.accentColor)
            .padding(.horizontal)

            Button {
                self.changePassword()
            } label: {
                Text("Changer de mot de passe")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .font(.custom("Formula1-Display-Bold", size: 20))
                    .foregroundColor(.white)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("OK"), action: {
                if alertMessage == "Password changed successfully!" {
                    change = false
                }
            }))
        }
    }

    func changePassword() {
        if newPassword.isEmpty || confirmPassword.isEmpty {
            alertMessage = "Please fill in all fields."
            showAlert = true
            return
        }

        if newPassword != confirmPassword {
            alertMessage = "New password and confirm password do not match."
            showAlert = true
            return
        }

        signVM.changePassword(current: current, new: newPassword)
        alertMessage = "Password changed successfully!"
        showAlert = true
    }
}

#Preview {
    ChangePasswdView(change: .constant(true), current: .constant(""))
        .environmentObject(AuthViewModel())
}
