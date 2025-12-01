//
//  WatchRecipeView.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import SwiftUI
import Foundation


struct WatchRecipeView: View {
    let userId: String
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Text("\(recipe.title)").font(.title).bold().padding(.top, 50)
            
            RatingView(rating: Binding(get: {
                recipe.difficulty
            }, set: { _ in }))
            
            Text("by \(recipe.author)").font(.body).foregroundStyle(.secondary)
            
            Form {
                details()
                ingredients()
                recipeSteps()
                images()
            }
        }
    }
    
    @ViewBuilder
    private func details() -> some View {
        Section("Details") {
            LabeledContent {
                Text("\(recipe.timeToCookString())").foregroundStyle(.secondary)
            } label: {
                Text("Time")
            }
            
            LabeledContent {
                Text("\(recipe.type.capitalized)")
                    .foregroundStyle(.secondary)
            } label: {
                Text("Type")
            }
        }
    }
    
    @ViewBuilder
    private func ingredients() -> some View {
        Section("Ingredients") {
            ForEach(recipe.ingredients) { ingredient in
                HStack {
                    Text("\(ingredient.title)")
                    
                    Spacer()
                    
                    Text("\(ingredient.quantity)\(Utils.foodQuantityType[ingredient.foodQuantityType].lowercased())").foregroundStyle(.secondary)
                }
            }
        }
    }
    
    @ViewBuilder
    private func recipeSteps() -> some View {
        Section("Recipe") {
            ForEach(recipe.recipeSteps) { step in
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(step.text)")
                        
                        Spacer()
                        
                        Text("\(step.time) \(step.timeType)").foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func images() -> some View {
        if !recipe.images.isEmpty {
            Section("Images") {
                ImagesView(imagesStrings: recipe.images, height: 200)
            }
        }
    }
}

#Preview {
    WatchRecipeView(userId: "123", recipe: Preview.recipe)
}
