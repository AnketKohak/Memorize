//
//  ContentView.swift
//  Memorize
//
//  Created by anket kohak on 25/12/24.
//

import SwiftUI

struct ContentView: View {
    let emojis : Array<String> = ["👻","🎃","🕷️"," 😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    @State var cardCount:Int = 4
    var body: some View {
        VStack {
            ScrollView{
                card
            }
            Spacer()
            cardAdjusters
        }.padding()
    }
    
    var card: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount,id: \.self){ index in
                CardView(content:  emojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        .foregroundStyle(.blue)
    }
    
    func cardCountAdjuster(by offset: Int, symbol:String) -> some View{
        Button(action: {
                cardCount += offset
        }, label :{
            Image(systemName: symbol)
        })
          .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")

    }
}


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
    ContentView()
}
