//
//  EmojiMemoryGame_ViewModel.swift
//  memorize
//
//  Created by Kota Suzuki on 2022/02/17.
//

import SwiftUI //viewmodelではこれ

//private(set): 参照のみ可
class EmojiMemoryGame: ObservableObject{
    static let emojis = ["🇲🇴","🇲🇬","🇾🇹","🇲🇼","🇲🇱","🇲🇹","🇲🇶","🇲🇾","🇮🇲","🇫🇲","🇲🇲","🇲🇽","🇲🇺","🇲🇷","🇲🇿","🇲🇨","🇲🇻","🇲🇩","🇲🇦","🇲🇳"]
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numbarOfpairOfCards: 3){pairIndex in
                EmojiMemoryGame.emojis[pairIndex]
        }
    }
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ cards:MemoryGame<String>.Card){
        model.choose(cards)
    }
}
