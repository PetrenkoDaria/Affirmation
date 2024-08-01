//
//  Category.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    let id: Int
    let name: LocalizedStringKey
    let image: String
}

extension Category {
    static func getStockCategory() -> [Category] {
        return [
                Category(id: 0, name: "All", image: "shuffle"),
                Category(id: 1, name: "Love", image: "heart.fill"),
                Category(id: 2, name: "Friendship", image: "person.2.fill")
            ]
        
    }
}


