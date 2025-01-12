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
    
    var card: some View{
       
        GeometryReader{  geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: viewModel.cards.count,
                size: geometry.size,
                atAspectRatio: aspectRatio            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize ), spacing: 0)]){
                ForEach(viewModel.cards){ card in
                    CardView(card)
                        .aspectRatio(aspectRatio,contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundStyle(.orange)
    }
    func gridItemWidthThatFits(
        count : Int,
        size : CGSize,
        atAspectRatio aspectRatio : CGFloat
    )-> CGFloat{
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat{
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height{
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        }while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
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

