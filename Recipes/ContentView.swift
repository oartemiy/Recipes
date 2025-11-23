//
//  ContentView.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LoginView().tabItem {
                Label("Login", systemImage: "person.circle")
            }
            
            RegisterView().tabItem {
                Label("Register", systemImage: "person.badge.plus")
            }
        }
    }
}

#Preview {
    ContentView()
}
