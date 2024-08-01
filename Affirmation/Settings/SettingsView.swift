//
//  SettingsView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @AppStorage("selectedCategory") var selectedCategory: Int = 0
    @AppStorage("genderIsMale") var genderIsMale: Bool = false
    @AppStorage("selectedColor") var selectedColor: Color = Color.blue
    @State var showCategoryView: Bool = false
    
    var body: some View {
        List {
            Section {
                Button {
                    showCategoryView = true
                } label: {
                    let categoryName = Category.getStockCategory()[selectedCategory].name
                    SettingsCellView(title: "Category", locValue: categoryName)
                }
                .foregroundStyle(.primary)
                
                ColorPicker("Background color", selection: $selectedColor)
                
                Button {
                    genderIsMale.toggle()
                } label: {
                    SettingsCellView(title: "Gender", locValue: genderIsMale ? "Male" : "Female")
                }.buttonStyle(.plain)
                
            } header: {
                Text("General")
                    .textCase(.uppercase)
            }
            
            Section {
                Button(action: self.settingsOpener) {
                    SettingsCellView(title: "Language", value: "\(Bundle.main.preferredLocalizations.first!)")
                }.buttonStyle(.plain)
            } footer: {
                Text("The language of the application corresponds to the language of the system.")
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCategoryView) {
            CategoryView()
        }
    }
    
    private func settingsOpener(){
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}


#Preview {
    SettingsView()
}
