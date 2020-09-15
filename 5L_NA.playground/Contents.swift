import UIKit



protocol Car {
    var color: UIColor { get set}
    var mark: String { get set}
    var mp3: Bool { get set}
    var ls: Int { get set}
    var typeFuel: typeFuel { get set}
    var transmission: transmission { get set}
    var establish: Int { get set}
 
    
    func start ()
    func stop ()
    func openWindow ()
    func closeWindow()
    func minOil()
    func msxOil()
}

extension Car {
    func start (){
        print("Двигатель запущен.")
    }
    func stop (){
        print("Двигатель заглушен")
    }
    func openWindow (){
        print("Открыть окно")
    }
    func closeWindow(){
        print("Закрыть окно")
    }
    func minOil(){
        print("Минимальный уровень масла, необходимо обратиться в сервис")
    }
    func msxOil(){
        print("Максимальный уровень масла, просьба обратиться в сервис")
    }
}


enum typeFuel{
    case diesel, gazoline
}

enum transmission{
    case auto, manual
}

class TrunkCar: Car{
  
    
    var color: UIColor
    var mark: String
    var mp3: Bool
    var ls: Int
    var typeFuel: typeFuel
    var transmission: transmission
    var establish: Int
    // новые свойства
    var lowGear: Bool
    var maxSpeed: Int
    var roofHeight: Double
    var driverLicenseCategory: Bool
    
    
    init(color: UIColor, mark: String, mp3: Bool, ls: Int, typeFuel: typeFuel, transmission: transmission, establish: Int, lowGear: Bool, maxSpeed: Int, roofHeight: Double, driverLicenseCategory: Bool) {
        self.color = color
        self.mark = mark
        self.mp3 = mp3
        self.ls = ls
        self.typeFuel = typeFuel
        self.transmission = transmission
        self.establish = establish
        self.lowGear = lowGear
        self.maxSpeed = maxSpeed
        self.roofHeight = roofHeight
        self.driverLicenseCategory = driverLicenseCategory
    }
    
    
}

extension TrunkCar: CustomStringConvertible{
    var description: String {
        return "Грузовой автомобиль для перевозки Цистерн"
    }
    
    
}

class SportCar: Car {
   
    var color: UIColor
    var mark: String
    var mp3: Bool
    var ls: Int
    var typeFuel: typeFuel
    var transmission: transmission
    var establish: Int
    // новые свойства
    var spoiler: Bool
    var hatch: Bool
    var sportsWheel: Bool
    var sportsSeats: Bool
    
    init(color: UIColor, mark: String, mp3: Bool, ls: Int, typeFuel: typeFuel, transmission: transmission, establish: Int, spoiler: Bool, hatch: Bool, sportWheel: Bool, sportsSeats: Bool) {
        self.color = color
        self.mark = mark
        self.mp3 = mp3
        self.ls = ls
        self.typeFuel = typeFuel
        self.transmission = transmission
        self.establish = establish
        self.spoiler = spoiler
        self.hatch = hatch
        self.sportsWheel = sportWheel
        self.sportsSeats = sportsSeats
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль среднего сегмента для города"
    }
}


let car1 = SportCar(color: .yellow, mark: "Tayota Supra", mp3: true, ls: 250, typeFuel: .gazoline, transmission: .manual, establish: 2012, spoiler: true, hatch: true, sportWheel: true, sportsSeats: true)
let car2 = SportCar(color: .red, mark: "Honda Civik", mp3: false, ls: 190, typeFuel: .gazoline, transmission: .manual, establish: 2006, spoiler: false, hatch: false, sportWheel: false, sportsSeats: false)

let car3 = TrunkCar(color: .black, mark: "Scania", mp3: true, ls: 160, typeFuel: .gazoline, transmission: .auto, establish: 2012, lowGear: true, maxSpeed: 120, roofHeight: 1250, driverLicenseCategory: true)
let car4 = TrunkCar(color: .brown, mark: "Volvo", mp3: false, ls: 150, typeFuel: .gazoline, transmission: .auto, establish: 2007, lowGear: false, maxSpeed: 110, roofHeight: 1400, driverLicenseCategory: true)





print(car1, car1.color, car1.mark, car1.mp3, car1.ls, car1.typeFuel, car1.transmission, car1.establish, car1.spoiler, car1.hatch, car1.sportsWheel,car1.sportsSeats)
car1 .start()

print(car2, car2.color, car2.mark, car2.mp3, car2.ls, car2.typeFuel, car2.transmission, car2.establish, car2.spoiler, car2.hatch, car2.sportsWheel,car2.sportsSeats)
car2 .minOil()

print(car3, car4.color, car3.mark, car3.mp3, car3.ls, car3.typeFuel, car3.transmission, car3.establish, car3.lowGear, car3.maxSpeed, car3.roofHeight, car3.driverLicenseCategory)
car3 .openWindow()

print(car4, car4.color, car4.mark, car4.mp3, car4.ls, car4.typeFuel, car4.transmission, car4.establish, car4.lowGear, car4.maxSpeed, car4.roofHeight, car4.driverLicenseCategory )
car4 .stop()
