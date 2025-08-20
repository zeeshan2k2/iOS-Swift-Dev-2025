//: [Previous](@previous)
/*:
 ## Object Oriented Programming
 Object Oriented Programming (OOP) is a programming concept based on building an app on objects. It is meant to make our apps easier to manage, develop and maintain.
 
 There are four main aspects of OOP:
 1. **Encapsulation** this is hiding the internal state or data of objects. Only the object that 'owns' the data can change its content. Other objects can only access or modify this data by sending messages.
 2. **Abstraction** is hiding all but relevant data about an object.
 3. **Inheritance** this means the objects of one class can derive its behaviour from another class and tailor that behaviour to suit its needs.
 4. **Polymorphism** this allows different objects that share a common interface to behave in their own way.
 
 *As a special note, inheritance is described as an **is-a** relationship. Composition is where an instance of a class or structure exists as a field in your class and this is described as a **has-a** relationship.*
 
 OOP should adhere to the SOLID principles which are:
 * Single responsibility principle
 * Open-closed principle
 * Liskov substitution principle
 * Interface segregation principle
 * Dependency inversion principle
 
*/

class Vehicle {
    let brand: String
    
    var description: String {
        return "Vehicle"
    }
    
    init(brand: String) {
        self.brand = brand
    }
    
    func getBrand() -> String {
        return brand
    }
    
    func start() {
        fatalError()
    }
    
    func stop() {
        fatalError()
    }
    
}

class Car: Vehicle {
    override var description: String {
        return getBrand()
    }
    
    static var hasFuel = false
    static var isServiced = false
    
    override func start() {
        if Car.hasFuel != true && Car.isServiced != true {
            print("couldnt start car")
        } else {
            print("start Car")
        }
    }
    
    override func stop() {
        print("stop Car")
    }
    
    func addFuel() {
        Car.hasFuel = true
    }
    
    func addService() {
        Car.isServiced = true
    }
}

class Bike: Vehicle {
    override var description: String {
        return "Bike"
    }
    
    override func start() {
        print("start Bike")
    }
    
    override func stop() {
        print("stop Bike")
    }
}

let car = Car(brand: "Ferrari")
let bike = Bike(brand: "Honda")
//car.start()
//print(Car.hasFuel)
//
//car.addFuel()
//car.addService()
//car.start()
//
//print(Car.hasFuel)




var vehicles = [Vehicle]()

vehicles.append(car)
vehicles.append(bike)


for vehicle in vehicles {
    if let car = vehicle as? Car {
        car.addFuel()
        car.addService()
        car.start()
    } else if let bike = vehicle as? Bike  {
        bike.start()
    }
}





//: [Next](@next)

