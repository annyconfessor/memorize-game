//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anny Caroliny on 07/10/24.
//

import Foundation

// MARK: - Model

struct MemoryModelGame<CardContent> {
    var cards: Array<Card>
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = true
        var content: CardContent
        var id: Int
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: bogus!
    }
    
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        let randomPairs = Int.random(in: 2...5)
        
        for pairIndex in 0..<randomPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
}
