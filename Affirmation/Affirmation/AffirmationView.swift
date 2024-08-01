//
//  AffirmationView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import SwiftUI
import StoreKit

struct AffirmationView: View {
    @Environment(\.requestReview) var requestReview
    @AppStorage("selectedColor") var selectedColor: Color = Color.blue
    @AppStorage("selectedCategory") var selectedCategory: Int = 0
    @StateObject var viewModel = AffirmationViewModel()
    @State var numberOfViews: Int = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0, content: {
                ForEach(
                    viewModel.affirmations.filter(
                        { item in
                            if selectedCategory == 0 {
                                return true
                            } else {
                                return item.categoryId == selectedCategory
                            }
                        }
                    ).shuffled()
                ) { affirmation in
                    AffirmationCardView(affirmation: affirmation)
                        .onAppear {
                            numberOfViews += 1
                            if numberOfViews % 5 == 0 {
                                requestReview()
                            }
                        }
                }
                .containerRelativeFrame(.vertical)
            })
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .background(selectedColor.gradient)
        .onAppear {
            viewModel.getAffirmations()
        }
    }
}

#Preview {
    AffirmationView()
}
