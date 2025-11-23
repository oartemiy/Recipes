//
//  RecipesApp.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//

import FirebaseCore
import SwiftUI

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication
//            .LaunchOptionsKey: Any]? = nil
//    ) -> Bool {
//        FirebaseApp.configure()
//
//        return true
//    }
//}

@main
struct RecipesApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
