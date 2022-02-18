//
//  EmojiMemoryGame_ViewModel.swift
//  memorize
//
//  Created by Kota Suzuki on 2022/02/17.
//

import SwiftUI //viewmodelではこれ

//private(set): 参照のみ可
class EmojiMemoryGame{
    static let emojis = ["🇲🇴","🇲🇬","🇾🇹","🇲🇼","🇲🇱","🇲🇹","🇲🇶","🇲🇾","🇮🇲","🇫🇲","🇲🇲","🇲🇽","🇲🇺","🇲🇷","🇲🇿","🇲🇨","🇲🇻","🇲🇩","🇲🇦","🇲🇳"]
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numbarOfpairOfCards: 4){pairIndex in
                EmojiMemoryGame.emojis[pairIndex]
        }
    }
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
}
