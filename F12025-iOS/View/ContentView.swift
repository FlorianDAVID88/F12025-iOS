//
//  ContentView.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Accueil")
                        }
                    
                    TeamsView()
                        .tabItem {
                            Image("Teams")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("Ecuries")
                        }
                    
                    TracksView()
                        .tabItem {
                            Image("Tracks")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Circuits")
                        }
                    
                    StandingsView()
                        .tabItem {
                            Image(systemName: "list.number")
                            Text("Classements")
                        }
                }
            }
            .navigationBarItems(leading:
                Image("f1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30),
            trailing:
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.red)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
