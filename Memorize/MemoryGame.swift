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
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card:Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    indexOfTheOneAndOnlyFaceUpCard = nil
                }
                else{
                    for index in cards.indices{
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
            
                
                 
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
