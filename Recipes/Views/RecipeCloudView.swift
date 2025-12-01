//
//  RecipeCloudView.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import SwiftUI
import FirebaseFirestore

struct RecipeCloudView: View {
    @StateObject private var viewModel = RecipeCloudViewModel()
    
    @FirestoreQuery private var notes: [RecipeCloudNote]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        
        self._notes = FirestoreQuery(collectionPath: "recipeCloudNotes")
    }
    
    var body: some View {
        Form {
            ForEach(notes) { note in
                RecipeView(userId: note.id, recipe: note.recipe)
            }
        }
    }
}


#Preview {
    RecipeCloudView(userId: "123")
}
