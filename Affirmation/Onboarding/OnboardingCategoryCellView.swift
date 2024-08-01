//
//  OnboardingCategoryCellView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 01.08.2024.
//

import SwiftUI

struct OnboardingCategoryCellView: View {
    
    var name: LocalizedStringKey = "Love"
    var image: String = "heart.fill"
    var isCkeckmark: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(height: 90)
                .foregroundStyle(.thickMaterial)
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "\(image)")
                }
                Spacer()
                HStack {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    Image(systemName: isCkeckmark ? "checkmark.circle" : "circle")
                }
            }
            .padding()
        }
    }
}
#Preview {
    OnboardingCategoryCellView()
}
