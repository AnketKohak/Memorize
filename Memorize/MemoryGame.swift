//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anket Kohak on 05/01/25.
//

import Foundation


struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory :(Int)-> CardContent){
        cards = []
        
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content :CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    func choose(card:Card){
        
    }
    
    struct Card{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
