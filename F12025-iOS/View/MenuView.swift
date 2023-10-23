//
//  MenuView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/26/23.
//

import SwiftUI

struct MenuView: View {
    @State private var isConnected: Bool = false
    
    var body: some View {
        VStack {
            List {
                NavigationLink(destination: AllPartenairesView()) {
                    Text("Nos partenaires")
                }
                NavigationLink(destination: F1_RSView()) {
                    Text("Réseaux sociaux F1")
                }
                NavigationLink(destination: AllMonoplacesView()) {
                    Text("Monoplaces 2025")
                }
            }
            .listStyle(.plain)
            .font(Font.custom("Formula1", size: 18))
            
            Spacer()
            VStack(spacing: 15) {
                HStack(spacing: 30) {
                    Image("f1")
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
                    if isConnected {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        
                        Spacer()
                    }
                    
                    NavigationLink(destination: EmptyView()) { //LogInView()
                        Text(isConnected ? "Se déconnecter" : "Connexion")
                            .font(Font.custom("Formula1", size: 18))
                            .underline()
                    }
                    /*
                    Button {
                        isConnected.toggle()
                    } label: {
                        
                    }*/
                }
                .padding(.top)
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 40)
                .background(.gray.opacity(0.5))
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
