import UIKit


// Первое задание
// x2 - 4 = 0
var x = 2
var y = 4
var result = (x * x) - y
print(result)

// Второе задание
//Даны катеты прямоугольного треугольника
// с = (a * a + b * b) квадратный корень (Гипотенуза)
// P = a + b + c (Периметр)
// S = (a * b)/2 (Площадь)

let a: Float = 5
let b: Float = 8
var c = sqrt(Float(a * a + b * b))
var p = a + b + c
var s = (a * b) / 2
print("Периметр",p,",Площадь",s,",Гипотенуза",c)


// Третье задаие

var str = "Введите сумму вклада, ввдете процент"

var a1: Double = 1000
var a2: Double = 5 / 100

var sum = a1 * a2 * 5 + a1
print (sum)



