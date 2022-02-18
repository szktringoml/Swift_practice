import UIKit

//Instance Methods
//:特定のStruct Class Enumのインスタンスに属する関数

//Modifying Value Types from Within Instance Methods
//:通常、StructとEnumはValuetypeなので、デフォルトではvaluetypeのプロパティはインスタンスメソッド内から変数することができない。しかし、mutatingによって、一時的に変更することができるようになる。メソッドの終了時に元の構造に核戻される。
struct Point{
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)

print("The point is now at(\(somePoint.x),\(somePoint.y))")
//注意：struct,enumの定数では、mutatingメソッドを利用することができない。例えば
//let fixedPoint = Point(x:3.0,y:3.0)
//fixedPoint.moveBy(x: 2.0, y: 2.0)
//this will report an error



//Type Methods
//:インスタンスメソッドは通常、Struct,Class,Enumなどの、タイプのインスタンスで呼び出すメソッドだが、staticで定義するとタイプ自体で呼び出されるメソッドを定義することもできる。それをタイプメソッドという。
class SomeClass {
    class func someTypeMethod(){
        //type method implementation goes here
        //タイプメソッドの本体内では、selfプロパティはその型のインスタンスではなく型自体を参照する
    }
}
SomeClass.someTypeMethod()


//LevelTrackerの実装：ゲームのさまざまなレベルまたはステージでのプレイヤーの進行状態を追跡する
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int){
        if level > highestUnlockedLevel { highestUnlockedLevel = level}
    }
    
    static func isUnlocked(_ level:Int) -> Bool{
        //もしすでに達したレベルだったらtrue
        return level <= highestUnlockedLevel
    }
    
    @discardableResult//この属性は、関数が値を返しても、戻り値が使用されていない場合にコンパイラが傾向を生成しないようにするもの
    mutating func advance(to level: Int)-> Bool{
        //もしすでに達していたらcurrentlevelを更新しtrueを返す
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        }else {
            //まだ達した人のいないレベルに到達したらfalseを返す
            return false
        }
    }
}

//LevelTrackerは、以下のPlayerクラスで使用され、ここのプレーヤーの進行状況を追跡及び更新する
class Player{
    var tracker = LevelTracker()
    let playerName: String
    func compute(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String){
        playerName = name
    }
}
//動作確認
//level1からスタート
var player = Player(name: "Suzuki")
player.compute(level: 1) //1上がる
print("highest Unlocked level is now \(LevelTracker.highestUnlockedLevel)")
//Suzukiのレベル2になったため、SuzukiのcurrentlevelとhighestUnlockedlevelが2になる
//もし、ゲーム内のどのプレイヤーもまだロックを解除していないレベルに移動しようとするプレイヤーを作成すると、advanceメソッドでfalseを返すため失敗する
player = Player(name: "Yumiki")
if player.tracker.advance(to: 6){
    print("player is now on level 6")
}else{
    print("level 6 hasn't yet been unlocked")
}
