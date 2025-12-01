//
//  Ingredient.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//

import Foundation

struct Ingredient: Codable, Identifiable, Hashable {
    let id: String
    var title: String
    var quantity: Int
    var foodQuantityType: Int
}
