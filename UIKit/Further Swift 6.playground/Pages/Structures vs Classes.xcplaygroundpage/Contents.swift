//: [Previous](@previous)
/*:
 ## Structures vs Classes
 Use a structure when:
 1. If you intend to encapsulate a few relatively simple data types then you should use structures.
 2. If you intend that the values to be copied rather than be referenced then you should use structures.
 3. If the properties stored by the structures are themselves value types.
 4. The structure does not need to inherit properties or behaviours from an existing type.

 Use classes otherwise.
 
*/


class Setting {
    var theme: String = "darkmode"
    var volume: Int = 0
}


struct User {
    var name: String
    var age: Int
}


var user = User(name: "jen", age: 3)

var user2 = user

user2.age = 10
user2.name = "jane"

//: [Next](@next)
