//
//  F12025_iOSApp.swift
//  F12025-iOS
//
//  Created by user234243 on 9/13/23.
//

import SwiftUI

@main
struct F12025_iOSApp: App {
    @StateObject var userAuth: UserAuthModel =  UserAuthModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(F1ViewModel())
                .environmentObject(userAuth)
                .navigationViewStyle(.stack)
        }
    }
}
