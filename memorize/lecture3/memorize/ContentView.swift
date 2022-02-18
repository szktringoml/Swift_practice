//
//  ContentView.swift
//  memorize
//
//  Created by Kota Suzuki on 2022/02/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🇲🇴","🇲🇬","🇾🇹","🇲🇼","🇲🇱","🇲🇹","🇲🇶","🇲🇾","🇮🇲","🇫🇲","🇲🇲","🇲🇽","🇲🇺","🇲🇷","🇲🇿","🇲🇨","🇲🇻","🇲🇩","🇲🇦","🇲🇳"]
    @State var emojiCount = 4
    var body: some View {
        VStack{
            ScrollView{ //下の配置に影響を与えず、与えられたスペース内でスクロールする
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    //id:\.self：emojisの要素を識別
                    ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View{
    @State var isFaceUp: Bool = false
    var content: String
    var body: some View{
        ZStack{
            //ローカル定数
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp{
            //fillかつstrokeの四角形は2つ必要
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)
            }else{
                shape.fill(.red)
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
    
}
