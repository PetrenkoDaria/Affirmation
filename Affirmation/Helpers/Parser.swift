//
//  Parser.swift
//  Affirmation
//
//  Created by Дарья Петренко on 31.07.2024.
//

import Foundation

class Parser {
    static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    static func parse(jsonData: Data) -> [Affirmation] {
        do {
            let decodedData = try JSONDecoder().decode([Affirmation].self,
                                                       from: jsonData)
            return decodedData
        } catch {
            print("decode error")
            return []
        }
    }
}
