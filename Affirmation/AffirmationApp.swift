//
//  AffirmationApp.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import SwiftUI

@main
struct AffirmationApp: App {
    @AppStorage("selectedColor") var selectedColor: Color = Color.blue
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(selectedColor)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
