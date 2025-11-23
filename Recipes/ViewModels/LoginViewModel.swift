internal import Combine
import FirebaseAuth
//
//  LoginViewModel.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//
import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""

    func login() {
        guard validate() else {
            self.errorMessage = "Please enter email and password"
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) {
            result,
            error in
            if error != nil {
                self.errorMessage = "Error logging in"
            }
        }
    }

    func validate() -> Bool {
//        self.errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }

        return true
    }
}
