//
//  CategoryCellView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 01.08.2024.
//

import SwiftUI

struct CategoryCellView: View {
    
    var name: LocalizedStringKey = "Love"
    var image: String = "heart.fill"
    var isCkeckmark: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 100)
                .foregroundStyle(Color(.secondarySystemGroupedBackground))
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "\(image)")
                }
                Spacer()
                HStack {
                    Text(name)
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
    CategoryCellView()
}
