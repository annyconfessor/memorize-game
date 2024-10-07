//
//  ContentView.swift
//  Memorize
//
//  Created by Anny Caroliny on 07/10/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(viewModel.cards, content: { card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.choose(card: card)
                })
            })
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryModelGame<String>.Card
    
    var body: some View {
        VStack {
            ForEach(0..<3, content: { index in
                if card.isFaceUp {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill(Color.white).frame(width: 2.3, height: 2.3)
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                        Text(card.content)
                    }
                } else {
                    RoundedRectangle(cornerRadius: 10).fill()
                }
            })
        }
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

