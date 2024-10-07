//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anny Caroliny on 07/10/24.
//

import SwiftUI

// MARK: - ViewModel

class EmojiMemoryGame: ObservableObject {
    
    // MARK: - Model
    
    @Published private var gameModel: MemoryModelGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryModelGame<String> {
        let emojis = ["🐼", "🐻", "🐥", "🪿", "🦄", "🐯", "🦋", "🐿️", "🐷", "🐧", "🐳", "🦩"]
        let shuffleEmojis = emojis.shuffled()
        return MemoryModelGame<String>(numberOfPairsOfCards: shuffleEmojis.count, cardContentFactory: { pairIndex in
            return shuffleEmojis[pairIndex]
        })
    }
    
    // MARK: - Give access to the Model - Interphone
    
    var cards: Array<MemoryModelGame<String>.Card> {
        gameModel.cards
    }
    
    // MARK: - Intent(s) - Goals
    
    func choose(card: MemoryModelGame<String>.Card) {
        gameModel.choose(card: card)
    }
}

