//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anket Kohak on 05/01/25.
//

import SwiftUI
 
class EmojiMemoryGame{
   static  let emojis =  ["👻","🎃","🕷️"," 😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    
   static func creataMemoryGame()->MemoryGame<String>{
       return MemoryGame(numberOfPairsOfCards: 4) { pairIndex  in
           if emojis.indices.contains(pairIndex){
               return emojis[pairIndex]
           }
           else{
               return "⁉️"
           }
        }
    }
    
    
    private var model = creataMemoryGame()
    
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}
