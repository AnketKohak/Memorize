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

        }
        .foregroundStyle(.orange)
        .padding()
    }
}
struct CardView : View{
    var isFaceUp : Bool = false
    var body : some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 12)

            }
        }
    }
}



#Preview {
    ContentView()
}
