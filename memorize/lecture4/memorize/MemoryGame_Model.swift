//
//  MemoryGame_Model.swift
//  memorize
//
//  Created by Kota Suzuki on 2022/02/17.
//

import Foundation //アプリ制作に必要な基本的なもの
struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        
    }
    
    init(numbarOfpairOfCards: Int, createCardContent: (Int)-> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numbarOfpairOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: <#T##CardContent#>))
            cards.append(Card(content: <#T##CardContent#>))
        }
    }
    //ここでstructの中にstructを作成するの、MemoryGame.Cardと名前づけするため。今後このアプリ内にさまざまなカードゲームが作成されるときのため、Cardが何に関するカードなのか分かりやすくしておく
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
