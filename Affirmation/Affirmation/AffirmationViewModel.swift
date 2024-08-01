//
//  AffirmationViewModel.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import Foundation

class AffirmationViewModel: ObservableObject {
    @Published var affirmations: [Affirmation] = []
    
    func getAffirmations() {
        if Bundle.main.preferredLocalizations.first! == "ru" {
            if let localData = Parser.readLocalFile(forName: "AffirmationsRu") {
                affirmations = Parser.parse(jsonData: localData)
            }
        } else {
            if let localData = Parser.readLocalFile(forName: "AffirmationsEn") {
                affirmations = Parser.parse(jsonData: localData)
            }
        }
        
    }
}
