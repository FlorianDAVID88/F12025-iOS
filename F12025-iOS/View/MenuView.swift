//
//  MenuView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/26/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MenuView: View {
    @EnvironmentObject var signVM: SignUpViewModel
    @State private var alertDisconnect = false
    
    var body: some View {
        VStack {
            List {
                NavigationLink(destination: AllPartnersView()) {
                    Text("Nos partenaires")
                }
                NavigationLink(destination: F1_RSView()) {
                    Text("Réseaux sociaux F1")
                }
                NavigationLink(destination: AllCarsView()) {
                    Text("Monoplaces 2025")
                }
            }
            .listStyle(.plain)
            .modifier(F1Regular(size: 18))

            Spacer()
            VStack(spacing: 15) {
                HStack(spacing: 30) {
                    Image("f1")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)

                    Button {
                        if let url = URL(string: "https://apps.apple.com/fr/app/formula-1/id835022598"){
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Image("Download_iOSApp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(height: 50)
                
                HStack(alignment: .center) {
                    if signVM.isLogged() {
                        HStack {
                            NavigationLink(destination: UserProfileView()) {
                                if let url = signVM.currentUser?.photoURL {
                                    WebImage(url: url)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 40)
                                        .cornerRadius(50)
                                } else {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                alertDisconnect.toggle()
                            } label: {
                                Text("Se déconnecter")
                                                            .underline()
                            }
                            .alert(isPresented: $alertDisconnect) {
                                Alert(
                                    title: Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
                                    primaryButton: .default(Text("Oui"), action: {
                                        signVM.disconnect()
                                    }),
                                    secondaryButton: .cancel(Text("Non"), action: {
                                        alertDisconnect = false
                                    }))
                            }
                        }
                    } else {
                        NavigationLink(destination: SliderSignView()) { //LogInView()
                            Text("Connexion")
                                                    .underline()
                        }
                    }
                }
                .padding(.top)
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 40)
                .background(.gray.opacity(0.5))
                .modifier(F1Regular(size: 18))
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(SignUpViewModel())
    }
}
