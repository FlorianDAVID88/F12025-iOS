//
//  SignInButton.swift
//  F1 2025
//
//  Created by Florian DAVID on 23/11/2023.
//

import SwiftUI

struct SignInButton: View {
    @EnvironmentObject var signVM: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var socialNetwork: String
    
    var body: some View {
        Button {
            signVM.signWith(rs: socialNetwork)
            if signVM.isLogged() { self.presentationMode.wrappedValue.dismiss() }
        } label: {
            HStack {
                Image("\(socialNetwork.lowercased())-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                Text("Sign in with \(socialNetwork)")
            }
            .padding()
            .background(getColors()[0])
            .cornerRadius(10)
            .modifier(F1Bold(size: 20))
            .foregroundColor(getColors()[1])
        }
    }
    
    func getColors() -> [Color] {
        let invertPrimary: Color = 
            UITraitCollection.current.userInterfaceStyle == .dark ? .black : .white
        
        switch socialNetwork {
            case "Google": return [.blue, .white]
            case "GitHub": return [.primary, invertPrimary]
            default: return [.gray, .black]
        }
    }
}

#Preview {
    SignInButton(socialNetwork: "GitHub")
        .environmentObject(AuthViewModel())
}
