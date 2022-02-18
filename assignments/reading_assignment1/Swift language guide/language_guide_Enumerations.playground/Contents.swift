import UIKit

//Associated Values
//enumを使用して、任意のタイプの関連する値を格納することができる

//Barcodeという列挙型を定義する。これは、4つのintを持つタプルが関連づけられている値、またはStringの値が関連づけられている値のいずれかを取ることができる.この定義は、実際のIntやStringを提供するものではない。
enum Barcode{
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
//上書きしたので、upcからqrCodeに変更された。どちらか一つしか格納できない

//Switchを使うと、さまざまなバーコードタイプを確認できる。
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

//列挙型のケースに関連づけられた全ての値を抽出する際、定数or変数どちらか一方として抽出するならば、括弧で括ることができる
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
