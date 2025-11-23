//
//  LoginView.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//
import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "Your Recipes Book",
                    subtitle: "All recipes in one place",
                    angle: 15,
                    background: Color(UIColor.systemIndigo)
                )

                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundStyle(.red)
                    }

                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    Button(
                        action: {
                            viewModel.login()
                        },
                        label: {
                            Text("Login")
                        }
                    )
                }

                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
