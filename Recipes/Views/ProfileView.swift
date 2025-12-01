//
//  ProfileView.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    let userId: String
    
    var body: some View {
        Text("Profile")
    }
}


#Preview {
    ProfileView(userId: "123")
}
