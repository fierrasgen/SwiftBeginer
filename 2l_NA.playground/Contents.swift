import UIKit




// первое задание
var numbarray = [1, 2, 3, 4 ,5 ,6 ,7 ,8 ,9, 10]

func isEven(num: Int) -> Bool {
    if num % 2 == 0 {
        return true
    } else {
        return false
    }
}

for BMW in numbarray {
    print (isEven(num: BMW))
    if BMW % 2 == 0 {
        print ("четное число", BMW)
    } else {
        print ("нечетное число", BMW)
}
}

// второе задание

var masarray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func isThree(num: Int) {
    if num % 3 == 0 {
        print ("Число", num, "делится на три")
    } else {
        print ("Число", num, "не делится на три")
}
}

for element in masarray {
    isThree(num: element)
}


// третье задание + 4 задание

var numbers = Array(1...100)


var final = numbers.filter ({$0 % 2 != 0 && $0 % 3 != 0})
print(final)




