import UIKit


//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//Вывести значения свойств экземпляров в консоль.



struct SportCar {
    var mark: String
    var establish: Int
    var bagLitre: Double
    var engineState: SportEngineState
    var windowState: SportWindowState
    var bagState: SportBagState
    
    init(mark: String, establish: Int, bagLitre: Double, engineState: SportEngineState, windowState: SportWindowState, bagState: SportBagState) {
        self.mark = mark
        self.establish = establish
        self.bagLitre = bagLitre
        self.engineState = engineState
        self.windowState = windowState
        self.bagState = bagState
    }
    
    mutating func engineStart () {
        self.engineState = .start
    }
}
enum SportEngineState {
    case start, stop
}
enum SportWindowState {
    case open, close
}
enum SportBagState{
    case full, empty
}

    


let car1 = SportCar(mark: "Land Rover", establish: 2014, bagLitre: 312, engineState: .start, windowState: .open, bagState: .empty)
let car2 = SportCar(mark: "Volvo", establish: 2015, bagLitre: 400, engineState: .stop, windowState: .close, bagState: .full)

func SportPrintAll () {
    print(car1.mark)
    print(car1.bagLitre)
    print(car1.engineState)
    print(car1.establish)
    print(car1.windowState)
    print(car1.bagState)
    print(car2.mark)
    print(car2.bagLitre)
    print(car2.engineState)
    print(car2.establish)
    print(car2.windowState)
    print(car2.bagState)
}







struct TrunkCar {
    let mark: String
    let establish: Int
    let bagLitre: Double
    var engineState: TrunkEngineState
    var windowState: TrunkWindowState
    var bagState: TrunkBagState
    
    init(mark: String, establish: Int, bagLitre: Double, engineState: TrunkEngineState, windowState: TrunkWindowState, bagState: TrunkBagState) {
           self.mark = mark
           self.establish = establish
           self.bagLitre = bagLitre
           self.engineState = engineState
           self.windowState = windowState
           self.bagState = bagState
       }
    
    mutating func windowOpen () {
        self.windowState = .open
       }
}

enum TrunkEngineState {
    case start, stop
}
enum TrunkWindowState {
    case open, close
}
enum TrunkBagState{
    case full, empty
}


func TrunkPrintAll () {
    print(car3.mark)
    print(car3.bagLitre)
    print(car3.engineState)
    print(car3.establish)
    print(car3.windowState)
    print(car3.bagState)
    print(car4.mark)
    print(car4.bagLitre)
    print(car4.engineState)
    print(car4.establish)
    print(car4.windowState)
    print(car4.bagState)
}

let car3 = TrunkCar(mark: "Mercedes", establish: 1993, bagLitre: 2500, engineState: .stop, windowState: .close, bagState: .full)
let car4 = TrunkCar(mark: "KAMAZ", establish: 1999, bagLitre: 3400, engineState: .start, windowState: .open, bagState: .empty)




SportPrintAll()
TrunkPrintAll()
