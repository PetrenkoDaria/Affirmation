//
//  Affirmation.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import Foundation

struct Affirmation: Codable, Identifiable {
    let categoryId: Int
    let id: Int
    let text: String
}
