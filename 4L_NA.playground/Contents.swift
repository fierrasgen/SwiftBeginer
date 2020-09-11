import UIKit



enum fuelState {
    case full, empty
}
enum Transmission {
    case manual, auto
}
enum tempEngine {
    case min, max
}
enum spoilerState {
    case open, close
}


class Car {
    var mark: String
    var establish: Int
    var bagLitre: Double

    
    init(mark: String, establish: Int, bagLitre: Double) {
        self.mark = mark
        self.establish = establish
        self.bagLitre = bagLitre

    }
    
    func maxSpeedAllert(){
}
    
}


class sportCar: Car{
    var hatch: Bool
    var Ls: Int
    var Mp3: Bool
    var Temp: tempEngine
    var Spoiler: spoilerState
    
    init(mark: String, establish: Int, bagLitre: Double, hatch: Bool, Ls: Int, Mp3: Bool, Temp: tempEngine, Spoiler: spoilerState) {
        self.hatch = hatch
        self.Ls = Ls
        self.Mp3 = Mp3
        self.Temp = Temp
        self.Spoiler = Spoiler
        super.init (mark: mark, establish: establish, bagLitre: bagLitre)
    }
    override func maxSpeedAllert(){
        print("Максимальная скорость 220 км/ч, пожалуйста сбросьте")
    }
}

class trunkCar: Car{
    var weight: Int
    var Fuel: String
    var diesel: fuelState
    var transmission: Transmission
    init(mark: String, establish: Int, bagLitre: Double, weight: Int, Fuel: String, diesel: fuelState, transmission: Transmission) {
        self.weight = weight
        self.Fuel = Fuel
        self.diesel = diesel
        self.transmission = transmission
        super.init (mark: mark, establish: establish, bagLitre: bagLitre)
    }
    override func maxSpeedAllert() {
        print("Максимальная скорость 110 км/ч, пожалуйста сбросьте")
    }
}
 

let car1 = sportCar(mark: "mitsubishi", establish: 2008, bagLitre: 350, hatch: true, Ls: 210, Mp3: true, Temp: .min, Spoiler: .open)
let car2 = sportCar(mark: "ford gt", establish: 2003, bagLitre: 300, hatch: false, Ls: 190, Mp3: true, Temp: .max, Spoiler: .close)
let car3 = trunkCar(mark: "Kamaz", establish: 1999, bagLitre: 1250, weight: 2000, Fuel: "gazoline", diesel: .full, transmission: .manual)
let car4 = trunkCar(mark: "Volvo", establish: 2015, bagLitre: 1900, weight: 2300, Fuel: "diezel", diesel: .empty, transmission: .auto)



func printSprortcar() {
    print(car1.mark)
    print(car1.establish)
    print(car1.bagLitre)
    print(car1.hatch)
    print(car1.Ls)
    print(car1.Mp3)
    print(car1.Temp)
    print(car1.Spoiler)
    print(car2.mark)
    print(car2.establish)
    print(car2.bagLitre)
    print(car2.hatch)
    print(car2.Ls)
    print(car2.Mp3)
    print(car2.Temp)
    print(car2.Spoiler)
}

func printTruncCar() {
    print(car3.mark)
    print(car3.establish)
    print(car3.bagLitre)
    print(car3.weight)
    print(car3.Fuel)
    print(car3.diesel)
    print(car3.transmission)
    print(car4.mark)
    print(car4.establish)
    print(car4.bagLitre)
    print(car4.weight)
    print(car4.Fuel)
    print(car4.diesel)
    print(car4.transmission)
}

printSprortcar()
printTruncCar()
