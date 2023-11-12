//
//  SignUpView.swift
//  F1 2025
//
//  Created by Florian DAVID on 02/11/2023.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var signVM: SignUpViewModel
    @State private var params = ["","","","",""]
    @Binding var isShowingSignIn: Bool
    @State private var allOK = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image("f1")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .foregroundColor(.accentColor)
            
            VStack(spacing: 5) {
                HStack {
                    TextFieldSignUp(content: $params[0], name_content: "Name")
                    TextFieldSignUp(content: $params[1], name_content: "Surname")
                }
                .padding(.vertical, 10)
                
                TextFieldSignUp(content: $params[2], name_content: "Email")
                TextFieldSignUp(content: $params[3], name_content: "Password")
                TextFieldSignUp(content: $params[4], name_content: "Confirm password")
            }
            .font(.custom("Formula1", size: 20))
            .foregroundColor(.accentColor)
            .padding()
            
            checkInputErrors()
            
            HStack(spacing: 5) {
                Text("If you have an account, you can log")
                Button {
                    withAnimation {
                        isShowingSignIn.toggle()
                    }
                } label: {
                    Text("here")
                        .underline()
                }
            }
            .font(.custom("Formula1", size: 14))
            
            Button {
                if params.allSatisfy({ $0 != "" }) {
                    signVM.signUpWithEmail(email: params[2], password: params[3])
                }
            } label: {
                Text("Submit")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .font(.custom("Formula1-Display-Bold", size: 20))
                    .foregroundColor(.white)
            }
        }
        .navigationBarTitle("New account", displayMode: .inline)
    }
    
    // Returns a View
    @ViewBuilder
    func checkInputErrors() -> some View {
        if !params.allSatisfy({ $0 == "" }) {
            HStack {
                if params[0] == "" { // Name empty
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Name empty")
                } else if params[1] == "" { // Surname empty
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Surname empty")
                } else if params[2] == "" { // Email empty
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Email empty")
                } else if !params[2].contains("@") { // Email not valid
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Email not valid")
                } else if params[3] == "" { // Password empty
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Password empty")
                } else if params[3].count < 6 { // Password too short
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Password too short")
                } else if params[3] != params[4] { // Password not the same
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Not the same password")
                }
            }
            .font(.custom("Formula1", size: 16))
            .foregroundColor(.red)
        }
    }
    
    struct TextFieldSignUp: View {
        @Binding var content: String
        @State var name_content: String
        
        var body: some View {
            if name_content.capitalized.contains("Password") {
                SecureField(name_content, text: $content)
                    .padding(10)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(10)
            } else {
                TextField(name_content, text: $content)
                    .padding(10)
                    .background(.gray.opacity(0.25))
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SignUpView(isShowingSignIn: Binding.constant(false))
}
