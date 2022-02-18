import UIKit

//-----Ternary Conditional Operator 三項条件演算子-----
//通常if文の処理になる記述を、一行に省略することができる。ただ、使い過ぎると読みにくくなるので注意
//if question {
//    answer1
//} else {
//    answer2
//}

//通常、このような記述になる
let contentHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}

//省略形
// |
// ↓
let contentHeight = 40
let hasHeader = true
//                              (条件 ? trueの時: falseの時)
let rowHeight = contentHeight + (hasHeader ? 50 : 20)



//-----Range Operators-----
//値の範囲を表すためのショートカット

//クローズドレンジ演算子
//a ~ b
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25


//ハーフオープンレンジ演算子
//a ~ (b-1)
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack


//片面レンジ
//listの添字指定方法で、クローズドレンジ、ハーフオープンレンジどちらも使える

//片面レンジのクローズドレンジ
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

//片面レンジのハーフオープンレンジ
for name in names[..<2] {
    print(name)
}
// Anna
// Alex

//片側レンジは、添字だけでなく、無限の範囲を定義することもできる
let range = ...5
print(type(of:range))
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
