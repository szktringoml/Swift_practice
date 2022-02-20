//
//  ContentView.swift
//  memorize
//
//  Created by Kota Suzuki on 2022/02/16.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject:viewModelの何かが変わったら、再描画
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView{ //下の配置に影響を与えず、与えられたスペース内でスクロールする
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                //id:\.self：emojisの要素を識別
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    var body: some View{
        ZStack{
            //ローカル定数
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
            //fillかつstrokeの四角形は2つ必要
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }else{
                shape.fill(.red)
            }
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
    
}
