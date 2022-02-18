import UIKit

//-----Switch-----
let someCharcter: Character = "z"
switch someCharcter{
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
//-----No Implicit Fallthrough-----

//使用しないcaseでも、無記入だとエラーになる
//let anotherCharacter: Character = "a"
//switch anotherCharacter {
//case "a":
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}


//-----Break-----
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol{
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue{
    print("The integer value of \(numberSymbol) is \(integerValue).")
}else{
    print("An integer value couldn't be found for \(numberSymbol).")
}


//-----Early Exit-----

//guardステートメントは、ifステートメントと同様に、式のブール値に応じてステートメントを実行する
//ifステートメントで同じチェックを行う場合と比較して、コードの可読性が向上する
func greet(person:[String: String]){
    guard let name = person["name"] else{
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else{
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name":"John"])
greet(person: ["name": "Jane","location":"Cupertino"])
