//
//  ReactionView.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import SwiftUI
import FirebaseAuth

struct ReactionView: View {
    let likes: [Id]
    let onImageTap: () -> Void
    let onTextTap: () -> Void
    
    var body: some View {
        let liked = likes.contains(where: { $0.id == Auth.auth().currentUser?.uid })
        
        HStack {
            Image(systemName: "hand.thumbsup\(liked ? ".fill" : "")")
                .foregroundStyle(liked ? .pink : .secondary)
                .onTapGesture {
                    onImageTap()
                }
            if likes.count > 0 {
                Text("\(likes.count)").fontWeight(.bold)
                    .font(.caption)
                    .onTapGesture {
                        onTextTap()
                    }
            }
        }
    }
}

#Preview {
    ReactionView(likes: [], onImageTap: {}, onTextTap: {})
}
