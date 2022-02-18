import UIKit

//Structure and Enumerations Are Value Types
//valuetypeは、変数または定数に割り当てられたとき、または関数に渡されたときに値がコピーされる型
struct Resolution{
    var width = 0
    var height = 0
}
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")
//つまり、hdをコピーしたシネマは、新しいインスタンスとして作成されているため、cinemaを変えてもhdに影響はない

//同じ動作が列挙型に当てはまる
enum CompassPoint{
    case north, south, east, west
    mutating func turnNorth(){
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current dirextion is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

