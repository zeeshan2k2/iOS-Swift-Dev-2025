//: [Previous](@previous)
/*:
 ## Classes
 Classes are **reference** types. When you pass an instance to a variable or constant a reference to same instance is assigned. It is possible for multiple constants and variables to refer to the same instance of a class. This is known as reference counting.
 
An instance of a class is created through *initialization*. Unlike structures, classes do not have memberwise initialization. This means that you need to have default values for all your properties or to at least provide the values at initialization in order to successfully create an instance of a class.
 
 Classes have abilities that structures do not. Classes allow you to inherit behaviour from other classes through subclassing. Classes also allow you to override methods inherited from other classes.
 
 It is possible to check and interpret the type of a class. This is known as type casting. We use the keywords `is` and `as` to acheive this. The `is` keyword is used to check whether a class is of a certain subclass type. The `as` keyword is used to refer to a class as a certain subclass type.
 
*/


struct UserStruct {
    var name: String
    var age: Int
    
    mutating func change(name: String) {
        self.name = name
    }
}

class UserClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func change(name: String) {
        self.name = name
    }
}


let userFromClass = UserClass(name: "jon", age: 10)

print("user from class name \(userFromClass.name)")

let userFromClass2 = userFromClass

userFromClass2.name = "den"
print("user from class name \(userFromClass.name)")
print("user from class name 2 \(userFromClass2.name)")


var userFromStruct = UserStruct(name: "jin", age: 10)
print("user from struct name \(userFromStruct.name)")

var userFromStruct2 = userFromStruct
userFromStruct2.name = "din"
print("user from struct name \(userFromStruct.name)")
print("user from struct name 2 \(userFromStruct2.name)")
userFromStruct.name = "don"


class Insect {
    let legs = 6
    var likes = "heh"
    
    var name: String {
        fatalError()
    }
    
    func walk() {
        print("\(name) is walking")
    }
    
    func stop() {
        print("\(name) has stopped walking")
    }
}

class Ant: Insect {
    
    override var name: String {
        return "ants"
    }
    
}

class Wasp: Insect {
    override var name: String {
        return "wasp"
    }
}

let ant = Ant()

ant.walk()


var insects = [Insect]()

let wasp = Wasp()

insects.append(wasp)
insects.append(ant)

for insect in insects {
    
//    if insect is Ant {
//        print("We found an ant")
//    } else if insect is Wasp {
//        let wasp = insect as! Wasp
//        print("We found a wasp")
//        wasp.walk()
//    }
    
    if let wasp = insect as? Wasp {
        wasp.walk()
    }
    else if let ant = insect as? Ant {
        ant.walk()
    }
    
}







//: [Next](@next)



