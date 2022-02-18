import UIKit

//-----Mutability of Collection-----
//配列、セット、ディクショナリ



//-----Arrays-----

//配列型の短縮構文
//Array<Element>:Elementに型を入れる


//空の配列の作成
var someInts: [Int] = []
print("SomeInts is of type [Int] with \(someInts.count) items.")


//デフォルト値で配列を作成する
var threeDoubles = Array(repeating: 0.0, count: 3)


//2つの配列を結合する
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles


//配列リテラルを使用した配列の作成
var shoppingList:[String] = ["Eggs","Milk"]
//型推論
var shoppingList_ = ["Eggs","Milk"]

//配列へのアクセスと変更
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty{
    print("The shopping list is empty")
}else{
    print("The shopping list isn't empty.")
}
//配列の反復
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]



//-----Dictionaries-----

//辞書タイプ省略構文

//空の辞書の作成
var namesOfIntegers: [Int: String] = [:]

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]


//辞書リテラルを使用した辞書の作成
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//keyとvalueの型が同じ時は、型の宣言を省略できる
var airports_ = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


//辞書へのアクセスと変更
print("The airports dictionary contains \(airports.count) items.")

if airports_.isEmpty{
    print("The airports dictionary is empty.")
}else{
    print("The airports dictionary isn't empty.")
}

airports_["LHR"] = "London"

airports_["LHR"] = "London Heathrow"

//もし添字指定したところに値が入ってたら更新
//updateValueは、keyの値をアップデートしつつ、古い値を返す
if let oldValue = airports_.updateValue("Dublin Airport",forKey: "DUB"){
    print("The old value for DUB was \(oldValue)")
}

//添字構文で値を取得することもできる
//optional値で返すため、からの場合はnilを返す
if let airportName = airports_["DUB"]{
    print("The name of the airport is \(airportName)")
}else{
    print("That airport isn't in the airports dictionary.")
}

//nilを当てはめることで、そのkeyの値を削除することができる
airports["APL"] = "Apple International"
airports["APL"] = nil


//辞書を反復処理する
for (airportCode, airportName) in airports_{
    print("\(airportCode): \(airportName)")
}
//keyだけ
for airportCode in airports_.keys{
    print("Airport code: \(airportCode)")
}
//valueだけ
for airportName in airports.values{
    print("Airport name: \(airportName)")
}

//keyまたはvalueをarrayで取得したい時は
let airportCodes = [String](airports_.keys)
let airportNames = [String](airports_.values)

