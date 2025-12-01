//
//  ImagesView.swift
//  Recipes
//
//  Created by Артемий Образцов on 01.12.2025.
//
import SwiftUI

struct ImagesView: View {
    let imagesStrings: [String]
    let height: CGFloat
    
    var body: some View {
        if !imagesStrings.isEmpty {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<imagesStrings.count, id: \.self) { i in
                        if let image = imagesStrings[i].imageFromBase64 {
                            image.resizable().scaledToFit().shadow(radius: 5)
                        }
                    }
                }
            }.frame(height: height)
        }
    }
}

#Preview {
    ImagesView(imagesStrings: [], height: 200)
}
