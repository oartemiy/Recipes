internal import Combine
import FirebaseAuth
import FirebaseFirestore
//
//  RegisterViewModel.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//
import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    private let db = Firestore.firestore()

    @discardableResult
    func register() -> Bool {
        guard validate() else {
            self.errorMessage = "Please, check rools: User name lenght <= 15 and password lenght >= 6"
            return false
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                self?.errorMessage = "Error creating user"
                return
            }
            
            self?.insertRecord(id: userId)
        }
        
        return errorMessage.isEmpty
    }
    
    private func insertRecord(id: String) {
        let user = User(
            id: id,
            username: username,
            email: email,
            joined: Date().timeIntervalSince1970
        )
        db.collection("users").document(id).setData(user.asDictionary())
    }

    func validate() -> Bool {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
            !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }
        
        guard username.count <= 15 else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }

}
