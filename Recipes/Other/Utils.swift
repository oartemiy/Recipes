//
//  Utils.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import Foundation
import FirebaseFirestore

class Utils {
    static let db = Firestore.firestore()
    
    static func getUserById(users: [User], userId: String) -> User? {
        return users.first(where: { $0.id == userId })
    }
    
    static let foodQuantityType: [String] = [
        "Grams",
        "Kilograms",
        "Milliliters",
        "Liters",
        "Pieces",
        "Teaspoons",
        "Tablespoons"
    ]
}
