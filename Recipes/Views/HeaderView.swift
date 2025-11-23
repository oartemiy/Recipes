//
//  HeaderView.swift
//  Recipes
//
//  Created by Артемий Образцов on 23.11.2025.
//
import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).foregroundStyle(background)
                .rotationEffect(.degrees(angle)).frame(
                    width: UIScreen.main.bounds.width * 3,
                    height: 370
                )
            VStack {
                Text(title).font(.system(size: 40)).foregroundStyle(.white).bold()
                Text(subtitle).font(.system(size: 25)).foregroundStyle(.white)
            }.padding(.top, 100)
        }.offset(y: -140)
    }
}

#Preview {
    HeaderView(
        title: "Title",
        subtitle: "Subtitles",
        angle: 15,
        background: Color.accentColor
    )
}
