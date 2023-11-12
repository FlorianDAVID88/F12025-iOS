//
//  UserProfileView.swift
//  F1 2025
//
//  Created by Florian DAVID on 10/28/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserProfileView: View {
    @EnvironmentObject var signVM: SignUpViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var alert: Bool = false
    
    var body: some View {
        //if let user = signVM.currentUser {
            VStack(spacing: 20) {
                HStack(spacing: 15) {
                    VStack {
                        Text("Flo David")//user.name)
                            .font(.custom("Formula1-Display-Bold", size: 24))
                        
                        Text("flodavid88@gmail.com")//user.email)
                            .font(.custom("Formula1", size: 16))
                    }
                    
                    let photUrl = URL(string: "https://cdn.group.renault.com/alp/master/formula-1/alpine-F1-A523-01%20desktop.jpg.ximg.largex2.webp/3d11b0564d.webp")
                    if photUrl != nil {
                        WebImage(url: photUrl)
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
                
                //if user.connexion != "Email" {
                    HStack {
                        Text("Connecté via Google") // \(user.connexion)")
                        Image("google-logo")//\(user.connexion.lowercased())-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                List {
                    ItemProfileView(nameText: "Nom", text: .constant("Flo David"))
                    ItemProfileView(nameText: "Nom", text: .constant("Flo David"))
                    ItemProfileView(nameText: "Nom", text: .constant("Flo David"))
                    ItemProfileView(nameText: "Nom", text: .constant("Flo David"))
                }
                .modifier(F1Regular(size: 20))
                .listStyle(.plain)
                
                    Spacer()
                //} else {
                    
                //}
                
                
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
            .navigationBarTitle("user - Profil", displayMode: .inline)
        //}
    }
}

struct ItemProfileView: View {
    @State var nameText: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(nameText)
            Spacer()
            TextEditor(text: $text)
                .frame(height: 35)
                .multilineTextAlignment(.trailing)
                .modifier(F1Regular(size: 20))
        }
    }
}

#Preview {
    UserProfileView()
        .environmentObject(SignUpViewModel())
}
