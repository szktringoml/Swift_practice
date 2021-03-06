//
//  ContentView.swift
//  memorize
//
//  Created by Kota Suzuki on 2022/02/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["ð²ð´","ð²ð¬","ð¾ð¹","ð²ð¼","ð²ð±","ð²ð¹","ð²ð¶","ð²ð¾","ð®ð²","ð«ð²","ð²ð²","ð²ð½","ð²ðº","ð²ð·","ð²ð¿","ð²ð¨","ð²ð»","ð²ð©","ð²ð¦","ð²ð³"]
    @State var emojiCount = 4
    var body: some View {
        VStack{
            ScrollView{ //ä¸ã®éç½®ã«å½±é¿ãä¸ãããä¸ããããã¹ãã¼ã¹åã§ã¹ã¯ã­ã¼ã«ãã
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    //id:\.selfï¼emojisã®è¦ç´ ãè­å¥
                    ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack{
                //buttonã®ããã«ãåé·ãªè¨è¿°ã«ãªããstructãä½ãã¾ã§ããªãã¬ã´ã¯å¤æ°ã«ãã¦å®ç¾©ããã¨ãã
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    var add: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        }label:{
            Image(systemName: "plus.circle")
        }
    }
    var remove: some View{
        Button{
            if emojiCount > 1{
                emojiCount -= 1
            }
        }label:{
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View{
    @State var isFaceUp: Bool = false
    var content: String
    var body: some View{
        ZStack{
            //ã­ã¼ã«ã«å®æ°
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp{
            //fillãã¤strokeã®åè§å½¢ã¯2ã¤å¿è¦
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
