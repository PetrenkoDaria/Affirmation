//
//  OnboardingBackColorView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 01.08.2024.
//

import SwiftUI

struct OnboardingBackColorView: View {
    
    @AppStorage("selectedColor") var selectedColor: Color = Color.blue
    @State var isBlue = true
    
    var body: some View {
        
        VStack {
            Text("Choose a background color")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .padding(.top, 30)
            
            Spacer()
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .foregroundStyle(.blue)
                    if isBlue {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.thickMaterial)
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .padding()
                .onTapGesture {
                    withAnimation(.interactiveSpring) {
                        selectedColor = .blue
                        isBlue = true
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .foregroundStyle(.red)
                    if !isBlue {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.thickMaterial)
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .padding()
                .onTapGesture {
                    withAnimation(.interactiveSpring) {
                        selectedColor = .red
                        isBlue = false
                    }
                }
            }
            .padding()
            Spacer()
        }
        .onAppear(perform: {
            isBlue = selectedColor == .blue
            print("isBlue: \(isBlue) | selectedColor: \(selectedColor)")
        })
    }
}
//
//#Preview {
//    OnboardingBackColorView()
//        .background(.blue.opacity(0.3))
//}
