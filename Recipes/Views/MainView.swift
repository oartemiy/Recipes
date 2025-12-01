//
//  ContentView.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            AccountView(userId: viewModel.currentUserId)
        } else {
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
}

#Preview {
    MainView()
}
