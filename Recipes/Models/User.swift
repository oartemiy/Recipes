//
//  User.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    var username: String
    var email: String
    var joined: TimeInterval
}
