import UIKit

//Closure Expressions

//ソートされたメソッド
//sorted(by:)メソッド：配列の内容と同じ2つの引数をとり、前後を入れ替えるか否かのboolを返すクロージャを受け入れる
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String,_ s2: String) -> Bool{
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)


//クロージャ式の構文
//上の例は、かなり長い記述になってします。よって、インラインクロージャを使って短縮する
//{(parameter:type) -> return type in
//    statement
//}
reversedNames = names.sorted(by: { (s1: String,s2: String) ->Bool in
    return s1 > s2
})

//コンテキストからタイプを推測する
//sorted(by:)メソッドは文字列の配列namesで呼び出されているため、クロージャが何を引数としてとるのか推測することができる.
//その場合、parameterを囲っていたカッコも省略できる
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2 })

//単一式のクロージャからの暗黙のリターン
//returnを省略できる
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )


//短縮引数名
//swiftは、インラインクロージャに自動的に短縮引数名を提供する
reversedNames = names.sorted(by:{$0 > $1})


//演算子メソッド
//sortedはboolを引数に取り、>は二つのstringを比べるということがわかるため、さらに省略できる
reversedNames = names.sorted(by: >)


//Trailing Closures
//関数の最後の引数としてクロージャを渡す時は、関数呼び出しカッコの後にトレイリングクロージャを記述することができる
//インラインに書き込むには記述が長すぎるときに役立つ
func someFunctionThatTakesAClosure(closure: () -> Void){
    //function body goes here
}

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

//たとえば
reversedNames = names.sorted() { $0 > $1 }
//クロージャが関数の唯一の引数として提供され、その式にトレイリングクロージャを用いる場合は、メソッドのカッコを記述する必要はない
reversedNames = names.sorted {$0 > $1}

//map(_:)はArrayの全要素に同じ処理をするときに使うメソッドだが、引数に一つの関数をとるため、トレイリングクロージャが役立つ
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{(number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 10
    return output
}

//関数が複数のクロージャをとる場合
//
func loadPicture(from server: Server, completion: (Picture) -> Void,onFailure:() -> Void){
    if let picture = download("photo.jpg", from: server){
        completion(picture)
    } else {
        onFailure()
    }
}
loadPicture(from: someServer){ picture in
    someView.currentPicture = picture
} onFailure:{
    print("Couldn't download the next picture.")
}
