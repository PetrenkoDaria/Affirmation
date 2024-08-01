//
//  ContentView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("showOnboarding") var showOnboarding = true
    
    var body: some View {
        NavigationStack {
            AffirmationView()
                .ignoresSafeArea()
                .overlay(alignment: .topTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.thinMaterial)
                                .shadow(color: .black.opacity(0.05), radius: 5)
                            
                            Image(systemName: "gearshape.fill")
                        }
                        .frame(width: 50, height: 50)
                        .padding()
                    }
                    .foregroundStyle(.primary)
                }
        }.fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView()
        })
    }
}


#Preview {
    ContentView()
}
