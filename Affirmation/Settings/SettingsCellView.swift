//
//  SettingsCellView.swift
//  Affirmation
//
//  Created by Дарья Петренко on 01.08.2024.
//

import SwiftUI

struct SettingsCellView: View {
    let title: LocalizedStringKey
    var locValue: LocalizedStringKey?
    var value: String?
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if let locValue {
                Text(locValue)
                    .foregroundStyle(.secondary)
            } else {
                Text(value ?? "")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SettingsCellView(title: "Category", value: "value")
}
