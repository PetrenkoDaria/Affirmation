//
//  OnboardingView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 01.08.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var selectedTabIndex = 0
    @AppStorage("selectedColor") var selectedColor: Color = Color.blue
    @AppStorage("showOnboarding") var showOnboarding = true
    
    var body: some View {
        ZStack {
            Color(selectedColor)
                .ignoresSafeArea()
                .opacity(0.3)
               
            VStack {
                Spacer()
                switch selectedTabIndex {
                case 0:
                    OnboardingCategoryView()
                        .transition(AnyTransition.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                case 1:
                    OnboardingBackColorView()
                        .transition(AnyTransition.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                case 2:
                    OnboardingGenderView()
                        .transition(AnyTransition.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                default:
                    OnboardingCategoryView()
                        .tag(0)
                        .transition(AnyTransition.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                }
                Spacer()
                Button {
                    withAnimation(.interactiveSpring) {
                        if selectedTabIndex < 2 {
                            selectedTabIndex += 1
                        } else {
                            showOnboarding = false
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(selectedColor)
                            .opacity(0.8)
                        Text("Next")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
