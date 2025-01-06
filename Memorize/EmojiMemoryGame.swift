//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anket Kohak on 05/01/25.
//
// MARK: - ViewModel
import SwiftUI
 
class EmojiMemoryGame:ObservableObject{
   static  let emojis =  ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    
   static func creataMemoryGame()->MemoryGame<String>{
       return MemoryGame(numberOfPairsOfCards: 16) { pairIndex  in
           if emojis.indices.contains(pairIndex){
               return emojis[pairIndex]
           }
           else{
               return "⁉️"
           }
        }
    }
    
    @Published private var model = creataMemoryGame()
    
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
        objectWillChange.send()
    }
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
