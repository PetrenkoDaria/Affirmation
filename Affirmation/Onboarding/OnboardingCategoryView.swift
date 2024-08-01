//
//  OnboardingCategoryView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import SwiftUI

struct OnboardingCategoryView: View {
    
    @AppStorage("selectedCategory") var selectedCategory: Int = 0
    let categories = Category.getStockCategory()
    
    var body: some View {
        
        VStack {
            Text("Сhoose an affirmation category")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .padding(.top, 30)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(categories) { category in
                        Button {
                            withAnimation {
                                selectedCategory = category.id
                            }
                        } label: {
                            OnboardingCategoryCellView(name: category.name, image: category.image, isCkeckmark: selectedCategory == category.id)
                                .padding(5)
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding(5)
            }
        }
    }
}

#Preview {
    OnboardingCategoryView()
        .background(.blue.opacity(0.3))
}
