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
            card
            cardAdjusters
        }.padding()
    }
    
    var card: some View{
        HStack{
            ForEach(0..<cardCount,id: \.self){ index in
                CardView(content:  emojis[index])
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
    
    var cardRemover: some View{
        Button(action: {
            if cardCount > 1{
                cardCount -= 1
            }
        }, label :{
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var cardAdder: some View{
        Button(action :{
            if cardCount < emojis.count{
                cardCount += 1
            }
        }, label :{
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
}


struct CardView : View{
    let content: String
    @State var isFaceUp : Bool = true
    
    var body : some View{
        ZStack{
            let base =  RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
               base.foregroundStyle(.white)
               base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else{
               base.fill()
            }
        }.onTapGesture() {
            isFaceUp.toggle()
            print("tapped")
        }
    }
}



#Preview {
    ContentView()
}
