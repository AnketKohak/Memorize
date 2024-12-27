//
//  ContentView.swift
//  Memorize
//
//  Created by anket kohak on 25/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            let emojis : Array<String> = ["👻","🎃","🕷️"," 😈"]
            ForEach(emojis.indices,id: \.self){ index in
                CardView(content:  emojis[index])
            }
        }
        .foregroundStyle(.orange)
        .padding()
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
