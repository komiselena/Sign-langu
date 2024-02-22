//
//  Card.swift
//  SignLanguage
//
//  Created by Mac on 12.02.2024.
//

import Foundation
import SwiftUI

struct Card: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var sign: String
    var offset: CGSize = .zero
    var isFaceUp: Bool
    var numbers: [Card] { [
        Card(image: "10", sign: "10", isFaceUp: false),
        Card(image: "9", sign: "9", isFaceUp: false),
        Card(image: "8", sign: "8", isFaceUp: false),
        Card(image: "7", sign: "7", isFaceUp: false),
        Card(image: "6", sign: "6", isFaceUp: false),
        Card(image: "5", sign: "5", isFaceUp: false),
        Card(image: "4", sign: "4", isFaceUp: false),
        Card(image: "3", sign: "3", isFaceUp: false),
        Card(image: "2", sign: "2", isFaceUp: false),
        Card(image: "1", sign: "1", isFaceUp: false),
        Card(image: "0", sign: "0", isFaceUp: false)
    ]
    }
    
    var alphabet: [Card] { [
        
        Card(image: "Z", sign: "Z", isFaceUp: false),
        Card(image: "Y", sign: "Y", isFaceUp: false),
        Card(image: "X", sign: "X", isFaceUp: false),
        Card(image: "W", sign: "W", isFaceUp: false),
        Card(image: "V", sign: "V", isFaceUp: false),
        Card(image: "U", sign: "U", isFaceUp: false),
        Card(image: "T", sign: "T", isFaceUp: false),
        Card(image: "S", sign: "S", isFaceUp: false),
        Card(image: "R", sign: "R", isFaceUp: false),
        Card(image: "Q", sign: "Q", isFaceUp: false),
        Card(image: "P", sign: "P", isFaceUp: false),
        Card(image: "O", sign: "O", isFaceUp: false),
        Card(image: "N", sign: "N", isFaceUp: false),
        Card(image: "M", sign: "M", isFaceUp: false),
        Card(image: "L", sign: "L", isFaceUp: false),
        Card(image: "K", sign: "K", isFaceUp: false),
        Card(image: "G", sign: "G", isFaceUp: false),
        Card(image: "I", sign: "I", isFaceUp: false),
        Card(image: "H", sign: "H", isFaceUp: false),
        Card(image: "G", sign: "G", isFaceUp: false),
        Card(image: "F", sign: "F", isFaceUp: false),
        Card(image: "E", sign: "E", isFaceUp: false),
        Card(image: "D", sign: "D", isFaceUp: false),
        Card(image: "C", sign: "C", isFaceUp: false),
        Card(image: "B", sign: "B", isFaceUp: false),
        Card(image: "A", sign: "A", isFaceUp: false)
    ]
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
