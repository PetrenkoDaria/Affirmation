//
//  OnboardingGenderView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 01.08.2024.
//

import SwiftUI

struct OnboardingGenderView: View {
    
    @AppStorage("selectedColor") var selectedColor: Color = Color.blue
    @AppStorage("genderIsMale") var genderIsMale: Bool = false
    var body: some View {
        
        VStack {
            Text("Choose your gender")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .padding(.top, 30)
            
            Spacer()
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .foregroundStyle(.thickMaterial)
                    if genderIsMale {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(selectedColor)
                            .opacity(0.5)
                    }
                    Text("Male")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .aspectRatio(1, contentMode: .fit)
                .padding()
                .onTapGesture {
                    withAnimation(.interactiveSpring) {
                        genderIsMale = true
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .foregroundStyle(.thickMaterial)
                    if !genderIsMale {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(selectedColor)
                            .opacity(0.5)
                    }
                    Text("Female")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .aspectRatio(1, contentMode: .fit)
                .padding()
                .onTapGesture {
                    withAnimation(.interactiveSpring) {
                        genderIsMale = false
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    OnboardingGenderView()
        .background(.blue.opacity(0.3))
}
