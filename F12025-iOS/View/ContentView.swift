//
//  ContentView.swift
//  F12025-iOS
//
//  Created by Florian DAVID on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme     // Couleur du thème de l'appareil
    @EnvironmentObject var viewModel: F1ViewModel
    @State private var showMenu: Bool = false
    @State private var titleTab: String = "Accueil".localized
    
    init() {
        let attributesBold: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Formula1-Display-Bold", size: 18)!,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Formula1", size: 14)!,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UINavigationBar.appearance().titleTextAttributes = attributesBold
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $titleTab) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Accueil".localized)
                        }
                        .tag("Accueil".localized)
                    
                    AllTeamsView()
                        .tabItem {
                            Image("Teams")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("Ecuries".localized)
                        }
                        .tag("Ecuries".localized)
                    
                    
                    AllGPView()
                        .tabItem {
                            Image("Tracks")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Grand Prix".localized)
                        }
                        .tag("Grand Prix".localized)
                    
                    
                    StandingsView()
                        .tabItem {
                            Image(systemName: "list.number")
                            Text("Classements".localized)
                        }
                        .tag("Classements".localized)
                }
            }
            .navigationBarTitle(showMenu ? "" : titleTab, displayMode: .inline)
            .navigationBarItems(leading: (
                HStack {
                    Button {
                        withAnimation {
                            showMenu.toggle()
                        }
                    } label: {
                        if showMenu {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                        } else {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                        }
                    }
                    Spacer(minLength: 0)
                    Image("f1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(.accentColor)
                }
            ))
            .overlay {
                if showMenu {
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            let color: Color = colorScheme == .dark ? .black : .white
                            color.opacity(0.75).ignoresSafeArea()
                            HStack {
                                ZStack {
                                    color.ignoresSafeArea()
                                    MenuView()
                                }
                                .frame(width: UIScreen.main.bounds.width * (2/3))
                                
                                Spacer()
                                    .frame(width: geometry.safeAreaInsets.bottom)
                            }
                            .transition(.slide.animation(.easeInOut))
                            .zIndex(1)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(F1ViewModel())
            .environmentObject(AuthViewModel())
            .environmentObject(APIViewModel())
    }
}
