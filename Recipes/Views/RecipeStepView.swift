//
//  RecipeStepView.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import SwiftUI

struct RecipeStepView: View {
    @State private var time: String = ""
    
    let recipeStep: Binding<RecipeStep>
    let deleteAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter Title", text: recipeStep.text)
                .textFieldStyle(DefaultTextFieldStyle())
            
            Text("This step takes:").foregroundStyle(.secondary)
            
            HStack {
                TextField("Time", text: $time)
                    .keyboardType(.numberPad)
                    .onChange(of: time) { _, newValue in
                        recipeStep.wrappedValue.time = Int(newValue) ?? 0
                    }
                    .onAppear {
                        time = String(recipeStep.wrappedValue.time)
                    }
                
                Picker("", selection: recipeStep.timeType) {
                    ForEach(["Second", "Minutes", "Hours"], id: \.self) { type in
                        Text("\(type)").tag(type)
                    }
                }
                .frame(minWidth: 150)
                .pickerStyle(.automatic)
            }
        }
        .swipeActions {
            Button {
                deleteAction()
            } label: {
                Label("Remove", systemImage: "trash")
            }
            .tint(.red)
        }
    }
}

