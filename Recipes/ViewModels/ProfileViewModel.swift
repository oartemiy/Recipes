//
//  ProfileViewModel.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import Foundation
internal import Combine
internal import FirebaseFirestoreInternal

class ProfileViewModel : ObservableObject {
    @Published var user: User?

    func fetchUser(userId: String) {
        Utils.db.collection("users").document(userId).getDocument {
            [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else { return }

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
