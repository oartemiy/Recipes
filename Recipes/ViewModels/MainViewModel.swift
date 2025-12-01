internal import Combine
import FirebaseAuth
import FirebaseFirestore
import Foundation
//
//  MainViewModel.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    @Published var user: User? = nil

    private let db = Firestore.firestore()
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }

    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }

    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        db.collection("users").document(userId).getDocument {
            [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }

            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    username: data["username"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }

        }
    }

}
