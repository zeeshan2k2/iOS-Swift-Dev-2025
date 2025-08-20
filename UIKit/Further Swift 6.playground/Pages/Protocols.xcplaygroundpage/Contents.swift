//: [Previous](@previous)
/*:
 ## Protocols
 A protocol defines a blueprint of methods, properties and other requirements that adopting classes, structures or enumerations must conform to. Protocols do not implement any functionlaity themselves but become fully-fledged types when used.
 
 When specifying the property requirements of a protocol all properties must be declared as variables. A protocol requires that a property is declared as gettable or settable which allows for a lot of flexibility in making the actual property a stored or computed property.
 
 When specifying the method requirements of a protocol all you need is the method name but without the curly braces.
*/

protocol Fruit {
    var color: String { get set }
    var isBitter: Bool { get }
    func eat()
}

class Apple: Fruit {
    var fruitColor = "red"
    
    var color: String {
        get {
            return "red"
        }
        set(newColor) {
            fruitColor = newColor
        }
    }
    var isBitter: Bool {
        get {
            return false
        }
    }
    
    func eat() {
        print("apple can be eaten")
    }
}


class Banana: Fruit {
    var color = "yellow"
    var isBitter: Bool = false
    
    var isPeel = false
    
    func eat() {
        if isPeel {
            print("banana can be eaten")
        } else {
            print("banana cannot be eaten")
        }
    }
    
}


let apple = Apple()
let banana = Banana()

apple.eat()
banana.eat()

banana.isPeel = true
banana.eat()


//: [Next](@next)
