import UIKit


// Первая версия, задание не завершено


enum CarShopError: Error {

    case invalidSelection                    // нет в ассортименте
    case outOfStock                          // нет в наличии
    case insufficientFunds(coinsNeeded: Int) // недостаточно денег, передаем недостаточную сумму
    case MarriageInProduction // Брак на производстве
}


struct Item {
    var price: Int
    var count: Int
    var marriage: String
    let mark: Mark
}

struct Mark {
    let name: String
}

class CarShop {
    var carModel = [
        "Ford": Item(price: 200, count: 5, marriage: "Брак на производстве", mark: Mark(name: "Ford")),
        "Opel": Item(price: 150, count: 3, marriage: "Брак на производстве", mark: Mark(name: "Opel")),
        "Chevrolete": Item(price: 125, count: 1, marriage: "Брак на производстве", mark: Mark(name: "Chevrolete"))
    ]

var cashDeposited = 0
var marriageCar = 0

func vend(itemNamed name: String) throws -> Mark {
    guard let item = carModel[name] else {
        throw CarShopError.invalidSelection
    }
    guard item.count > 0 else {
        throw CarShopError.outOfStock
    }
    guard item.price <= cashDeposited else {
        throw CarShopError.insufficientFunds(coinsNeeded: item.price - cashDeposited)
    }
    guard item.marriage <= marriageCar  else {
        throw CarShopError.MarriageInProduction
    }
    cashDeposited -= item.price
    var newItem = item
    newItem.count -= 1
    carModel[name] = newItem
    return newItem.mark
}
}





