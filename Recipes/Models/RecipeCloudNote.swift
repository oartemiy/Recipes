//
//  RecipeCloudNote.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import Foundation
import FirebaseAuth
internal import FirebaseFirestoreInternal

struct RecipeCloudNote: Codable, Identifiable {
    let id: String
    var authorId: String
    var recipe: Recipe
    var comment: String
    var createdAt: TimeInterval
    
    func savedRecipe() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let id = Id(id: userId)
        
        Utils.db.collection("recipeCloudNotes")
            .document(self.id)
            .collection("savings")
            .document(id.id)
            .setData(id.asDictionary())
        
        Utils.db.collection("users")
            .document(userId)
            .collection("recipes")
            .document(self.recipe.id)
            .setData(self.recipe.asDictionary())
    }
}
