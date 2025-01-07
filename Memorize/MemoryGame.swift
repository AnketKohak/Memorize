//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anket Kohak on 05/01/25.
//
// MARK: - Model 
import Foundation


struct MemoryGame<CardContent> where CardContent:Equatable  {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory :(Int)-> CardContent){
        cards = []
        
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content :CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content,id: "\(pairIndex+1)a"))
            cards.append(Card(content: content,id: "\(pairIndex+1)b"))
        }
    }
    mutating func choose(_ card:Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                
            
                
                 
                cards[chosenIndex].isFaceUp = true
            }
            
        }
    }
   
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card:Equatable,Identifiable,CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
        var debugDescription: String{
             "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "Matched":" ")"
        }

    }
}
