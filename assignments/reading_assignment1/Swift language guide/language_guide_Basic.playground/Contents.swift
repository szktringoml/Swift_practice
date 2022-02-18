import UIKit
//-----定数と変数-----

//定数と変数の宣言
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
var x = 0.0, y=0.0, z=0.0


//type注釈
var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue: Double


//定数と変数の命名
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
//数字から始めるとError
//let 1π = 3.14159265
var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjour"
let language = "Swift"
//定数は上書きできないのでError
//language = "Swift++"

//定数と変数の出力
print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")



//-----コメント-----

//一行
//This is a comment.

//複数行
/* this is also a comment
 but is written over multiple lines*/

//複数行コメントのネスト
/*this i the start of te first multiline comment.
 /* this is the second, nested multiline comment.*/
 this is the end of the first multiline comment*/



//-----セミコロン-----

//一行に複数の個別のステートメントを記述したい場合
let cat = "🐱"; print(cat)



//-----整数-----

//整数の境界
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8



//-----浮動小数点数-----

//Double:64ビット浮動小数点数
//float:32ビット浮動小数点数



//-----型安全性と型推論-----

let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int

//floatではなく、常にDoubleと推測される
let pi = 3.14159
// pi is inferred to be of type Double

let anotherPi = 3 + 0.14159
//anotherPi is also inferred to be of type Double



//-----数値リテラル-----

//接頭辞のない10進数
//プレフィックス付きの2進数:0b
//接頭辞付きの8進数:0o
//プレフィックス付きの16進数:0x
let dicimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//読みやすくするための追加フォーマット
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let jistOverOneMillion = 1_000_000.000_000_1



//-----数値型変換-----

//整数変換
//Int8:-128~127
//UInt8:0~255

//異なる数値タイプ同士で演算を行うには、目的のタイプの新しい数値を既存の値で初期化する必要がある
let twoThousand: UInt16 = 2_000
let one: UInt = 1
let TwoThousandAndOne = twoThousand + UInt16(one)

//整数及び浮動小数点変換
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi_ = Double(three) + pointOneFourOneFiveNine

let integerpi = Int(pi_)



//-----タイプエイリアス-----
//既存のたいぷの代替名を定義する

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min



//-----ブール値-----
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious{
    print("Mmm, tasty turnips")
}else{
    print("Eww, turnips are horrible")
}



//-----タプル-----
//複数の値を一つの複合値にグループ化する

let http404Error = (404, "Not Found")
//タプルの値を別々に抽出することもできる
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

//タプルのいずれかを無視したいときはアンダースコア
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//個々の要素に名前をつけることもできる
let http200Status = (statusCode: 200, description: "OK")

//名付けた値にアクセス
print("The status code is \(http200Status.statusCode)")
print("The status Message is \(http200Status.description)")



//-----optionals-----

//StringからIntに変換するためのイニシャライザを使った例
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print(convertedNumber) //ここでイニシャライザが失敗する可能性があるため、Intではなくoptionalで返している


//nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
//surveyAnswer is automatically set to nil


//ifステートメントと強制アンラッピング
if convertedNumber != nil{
    print("convertedNumber contains some integer values")
}
if convertedNumber != nil{
    //optionalの値をアンラップするときには!を入れる
    print("convertedNumber has integer value of \(convertedNumber!)")
}


//optionalのバインディング
//optionalに値が含まれていたら、それを変数や定数として扱う処理
//if let constantName = someOptional{
//    statements
//}

//強制アンラップではなく、バインディングを用いることもできる
if let actualNumber = Int(possibleNumber) {
    print("The String \"\(possibleNumber)\" has an integer value of \(actualNumber)")
}else{
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}


//optionalのバインディングとif条件をコンマで区切って同時に使うこともできる
//optionalがnilまたは条件が満たされないとき,falseの判定になる
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100{
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


//暗黙的にアンラップされたoptional
//?ではなく!を用いて定義することで、値が含まれていることが確定しているoptionaを定義することができる
//その場合、アンラップする際に!を記述する必要がなくなる
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point


let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.
