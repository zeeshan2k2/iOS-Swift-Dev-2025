//: [Previous](@previous)
/*:
 ## Loops
 A loop runs a block of code a certain number of times. A loop iterates over a sequence such as an array, dictionary or a range.
 
 ![rollercoaster](rollercoaster.png)
 
 **for-in** is a loop used to iterate over the elements of an array or dictionary one by one. The for-in loop can also iterate through a range. To iterate over a sequence inclusively we use the closed range operator (...). To iterate exclusively we use the half range operator (..<).
 
    let students = ["James", "Jane", "Jill"]
    for number in numbers {
        print(number)
    }
 
 The code above will print all the strings in the array.
 
    for number in 1...4 {
        print(number)
    }
 
 The code above will print the numbers 1 2 3 4
 
    for number in 1..<4 {
        print(number)
    }
 
 The code above will print the numbers 1 2 3
 
 **while** is a loop that performs a set of statements until a condition becomes false.
 
    var currentNumber = 0
    while currentNumber < 5 {
        print(currentNumber)
        currentNumber += 1
    }
 
 The while-loop will print the numbers 0 1 2 3 4. The while-loop tests whether `currentNumber` is less than 5 before continuing to go round the loop. Once `currentNumber` becomes greater than equal or greater than 5, then it stops the loop.
 
 **repeat-while** performs a single pass through the loop block before considering the loop's condition.
 
     var currentNumber = 0
     repeat {
        print(currentNumber)
        currentNumber += 1
     }
     while currentNumber < 5
 
 */
//: [Next](@next)





let students = ["James", "Jane", "Jill"]
let studentScores = ["James": 88, "Jane": 92, "Jill": 85]

for studentScore in studentScores {
    print("\(studentScore.value) is the student of \(studentScore.key)")
}

for student in students {
    print("This is the \(students.firstIndex(of: student)! + 1) student : \(student)")
}

var shopStock = ["Apple", "Banana", "Orange"]
var cartItems: [String] = []

func addToCart(_ item: String) {
    for (index, stock) in shopStock.enumerated() {
        if stock == item {
            cartItems.append(item)
            shopStock.remove(at: index)
        }
    }
    
    print("This is the shopStock: \(shopStock)")
    print("This is the cartItems: \(cartItems)")
}
    
func removeFromCart(_ item: String) {
    for (index, cartItem) in cartItems.enumerated() {
        if cartItem == item {
            shopStock.append(item)
            cartItems.remove(at: index)
        }
    }
    
    print("This is the shopStock: \(shopStock)")
    print("This is the cartItems: \(cartItems)")
}


var itemsToBuy = ["Banana", "Orange", "Apple", "Lemon", "Strawberries"]


for item in itemsToBuy {
    addToCart(item)
}


removeFromCart("Banana")

//for number in 3..<10 {
//    print(number)
//}


var number = 0

while number <= 5 {
    number += 1
    print(number)
}

var number1 = 0
repeat {
    number1 += 1
    print(number1)
} while number1 <= 5


