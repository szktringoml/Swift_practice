//
//  memorizeApp.swift
//  memorize
//
//  Created by Kota Suzuki on 2022/02/16.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame() //EmojiMemoryGameはclassのため、このgameはそれへのポインタにすぎない
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
