//
//  Utils.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import SwiftUI

extension Color: RawRepresentable {

    public init?(rawValue: String) {
        guard let data = Data(base64Encoded: rawValue) else {
            self = .gray
            return
        }
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) ?? .gray
            self = Color(color)
        } catch {
            self = .gray
        }
    }

    public var rawValue: String {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
}
