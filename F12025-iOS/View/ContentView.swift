//
//  ContentView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import Localize_Swift
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: F1ViewModel

    init() {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Formula1", size: 14)!,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Accueil")
                        }
                    
                    AllTeamsView()
                        .tabItem {
                            Image("Teams")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("Ecuries")
                        }
                    
                    AllGPView()
                        .tabItem {
                            Image("Tracks")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Grand Prix")
                        }
                    
                    StandingsView()
                        .tabItem {
                            Image(systemName: "list.number")
                            Text("Classements")
                        }
                }
            }
            .navigationBarItems(leading: (
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.horizontal.3") // Icône du bouton de menu
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                    }
                    
                    Image("f1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                }
            ))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(F1ViewModel())
    }
}
