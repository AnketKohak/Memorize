//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by anket kohak on 25/12/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel : EmojiMemoryGame = EmojiMemoryGame()
    let emojis : Array<String> = ["👻","🎃","🕷️"," 😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    var body: some View {
        VStack {
            ScrollView{
                card
            }
        }.padding()
    }
    
    var card: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(emojis.indices,id: \.self){ index in
                CardView(content:  emojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
}
// Cardview
struct CardView : View{
    let content: String
    @State var isFaceUp : Bool = true
    
    var body : some View{
        ZStack{
            let base =  RoundedRectangle(cornerRadius: 12)
            Group{
               base.foregroundStyle(.white)
               base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture() {
            isFaceUp.toggle()
            print("tapped")
        }
    }
}



#Preview {
    EmojiMemoryGameView()
}
