import UIKit

//Type Properties
//特定のタイプの全てのインスタンスに共通の値を定義するのに役立つ

//type propertiesの構文
struct SomeStructure{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 1
    }
}
enum SomeEnumeration{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 6
    }
}
class SomeClass{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 27
    }
    //staticの代わりにclassキーワードを用いてサブクラスがスーパークラスの実装をオーバーライドできるようにすることができる
    class var overrideableComputedTypeProperty: Int{
        return 107
    }
}


//タイププロパティのクエリと設定
print(SomeStructure.storedTypeProperty)
// Prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"



//オーディオチャネルの実装
struct AudioChannel{
    static let thresholdLevel = 10
    static var maxInputLevelForAllChanels = 0
    var currentLevel: Int = 0{
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChanels{
                AudioChannel.maxInputLevelForAllChanels = currentLevel
            }
        }
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChanels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChanels)
