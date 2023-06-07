//
//  TwitterApp.swift
//  Twitter
//
//  Created by Dylan  Tao on 7/26/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase

@main
struct TwitterApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
//                LoginView()
//                ProfilePhotoSelectView()
                    
            }
            .environmentObject(viewModel)
            .navigationViewStyle(.stack)
           
        }
    }
}

//class AppDelegate: NSObject
