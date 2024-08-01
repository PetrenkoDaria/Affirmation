//
//  CategoryView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import SwiftUI

struct CategoryView: View {
    
    @AppStorage("selectedCategory") var selectedCategory: Int = 0
    let categories = Category.getStockCategory()
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(categories) { category in
                        Button {
                            withAnimation {
                                selectedCategory = category.id
                            }
                        } label: {
                            CategoryCellView(name: category.name, image: category.image, isCkeckmark: selectedCategory == category.id)
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding()
            }
            .navigationTitle("Category")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    NavigationView {
        CategoryView()
    }
}
