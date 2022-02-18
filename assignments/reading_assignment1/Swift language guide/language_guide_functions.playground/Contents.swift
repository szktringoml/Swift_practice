import UIKit

//Function Augument Labels and Parameter Names

func someFunction(firstParameterName: Int, secondParameterName: Int){
    //パラメータ名は、関数の実装で使う
}
//デフォルトでは、パラメータ(firstParameterName,secondParameterName)を引数ラベルとして扱う
someFunction(firstParameterName: 1,secondParameterName: 2)

//引数ラベルの指定
func someFunction(argumentLabel parameterName: Int){
    
}
func greet(person: String, from hometown: String)-> String{
    return "Hello \(person), Glad you could visit from \(hometown)"
}
print(greet(person:"Bill", from:("Cupertino")))


