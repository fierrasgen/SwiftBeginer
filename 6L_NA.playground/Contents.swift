import UIKit


class Count {
    var A: Int
    var B: Int
    var C: Int
    var D: Int
    
    func calc() -> Int {
        return (A + B) * (C + D)
    }
    
    init(A: Int, B: Int, C: Int, D: Int) {
        self.A = A
        self.B = B
        self.C = C
        self.D = D
    }
}


struct queue<T>{
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    let even: (Int) -> Bool = { (element: Int) -> Bool in
        return element % 3 == 0}
    
    
    func filter (predicate: (T) -> Bool) -> [T] {
            var tempArray = [T]()
        
            for item in elements {
                if predicate(item) {
                    tempArray.append(item)
                }
            }
            
            return tempArray
        }
}

var countQueue = queue<Count>()

countQueue.push(Count(A: 1, B: 2, C: 3, D: 4))
countQueue.push(Count(A: 5, B: 6, C: 7, D: 8))
countQueue.push(Count(A: 9, B: 10, C: 11, D: 12))

let filteredElements = countQueue.filter(predicate: {c in return c.A < 12})
for i in filteredElements {
    print(i) }

























