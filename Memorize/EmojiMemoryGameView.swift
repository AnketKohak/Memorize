//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by anket kohak on 25/12/24.
//
// MARK: - View

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject   var viewModel : EmojiMemoryGame
    private let aspectRatio : CGFloat = 2/3
    var body: some View {
        VStack {
            card
                .animation(.default, value: viewModel.cards)
            
            Button("Suffule"){
                viewModel.shuffle()
            }
        }.padding()
    }
    
    private  var card: some View{
        
        AspectVGrid(viewModel.cards,aspectRatio: aspectRatio){ card in
            
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                    
                }
            
        }
        .foregroundStyle(.orange)
    }

}
// Cardview
struct CardView : View{
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card){
        self.card = card
    }
    var body : some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }.opacity(card.isFaceUp ? 1: 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }.opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

