import UIKit

//-----String Interpolation 文字列補間-----
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//拡張区切り文字#で囲むことで補間を無効化できる
print(#"Write an interpolated string in Swift using Swift using \(multiplier)."#)

//拡張区切り文字内で文字列補間を使用
print(#"6 times 7 is \#(6*7)."#)



//-----Counting Charactrers-----
//character文字列内の値を取得するには.countプロパティを使用する

let unusualMenageie = "Koala, Snail, Penguin, Dromedary"
print("unisualMenagerie has \(unusualMenageie.count) characters")
//この結果は文字列内の空白も含む

//変数wordに拡張書記素クラスタを使用しても、文字列の数に値を与えるとは限らない
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"



//-----Accessing and Modifying a String-----
//文字列にアクセスして変更するには、そのメソッドとプロパティを使用するか、添字構文を使用する


//文字列インデックス
//Swiftでは、文字それぞれで、格納するメモリの量が異なる可能性があるため、特定の位置にある文字を判別するには、各Unicodeスカラーをその先頭または末尾から繰り返す必要がある。よって、Swift文字列は整数値でインデックス付けできない

//startIndexプロパティ：0番目の位置にアクセス
//endIndexプロパティ：最後の位置の後ろの位置にアクセス 注意。
//index(befor:)またはindex(after:)：特定のインデックスの前後のインデックスにアクセス
//index(_:offsetBy:)指定されたインデックスよりさらに離れたインデックスにアクセス
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(after: greeting.startIndex)]
greeting[greeting.index(before: greeting.endIndex)]

let index = greeting.index(greeting.startIndex,offsetBy: 7)
//offsetByで指定する値は、添字と同じく0から数える
greeting[index]

//indicesプロパティを使用すると、文字列内の個々の文字のすべてのインデックスにアクセスする
for index in greeting.indices{
    print("\(greeting[index])", terminator:"")
}


//挿入と削除

//insert(_:at:):指定されたインデックスの位置に単一の文字を挿入:
//insert(contentsOf:at:):指定されたインデックスの位置に文字列を挿入:
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)

welcome.insert(contentsOf:" there",at: welcome.index(before: welcome.endIndex))

//remove(at:)：1文字削除
//removeSubrange(_:)：指定された範囲を削除
welcome.remove(at: welcome.index(before: welcome.endIndex))

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)



//-----Substrings 部分文字列-----
//prefix(_:)のようなメソッドを使用して、文字列から部分文字列を取得した時、それはStringではなくSubstringインスタンスとして取得される。つまり、元の文字列と同じメモリを参照していることになり、サブストリングが使用されている限り元の文字列全体をメモリに保たなくてはいけなくなるため長期保存には適していない。
let greeting_ = "Hello, world!"
let index_ = greeting_.firstIndex(of: ",") ?? greeting_.endIndex
let beginning = greeting_[..<index_]
let newString = String(beginning)


