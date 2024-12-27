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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView(isFaceUp: true)

        }
        .foregroundStyle(.orange)
        .padding()
    }
}
struct CardView : View{
    @State var isFaceUp : Bool = false
    var body : some View{
        ZStack{
            let base =  Circle()

            if isFaceUp{
               base.foregroundStyle(.white)
               base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
            else{
               base.fill()

            }
        }.onTapGesture {
            isFaceUp.toggle()
            print("tapped")
        }
    }
}



#Preview {
    ContentView()
}
