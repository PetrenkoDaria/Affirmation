//
//  AffirmationCardView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 01.08.2024.
//

import SwiftUI

struct AffirmationCardView: View {
    let affirmation: Affirmation
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Spacer()
                Text(affirmation.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.thickMaterial)
                    .shadow(color: .black.opacity(0.25), radius: 1)
                    .padding()
                Spacer()
                Text(Category.getStockCategory()[affirmation.categoryId].name)
                    .font(.headline)
                    .foregroundStyle(.thickMaterial)
                    .shadow(color: .black.opacity(0.25), radius: 1)
                Spacer()
            }
        }
    }
}

#Preview {
    AffirmationCardView(affirmation: Affirmation(categoryId: 1, id: 1, text: "sldadlkjasdl;naslkdn"))
}
