//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anket Kohak on 05/01/25.
//
// MARK: - Model 
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
    func choose(_ card:Card){
        
    }
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card{
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
