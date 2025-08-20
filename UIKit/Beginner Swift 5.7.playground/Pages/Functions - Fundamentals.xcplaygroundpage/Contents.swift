//: [Previous](@previous)
/*:
 ## Functions - Fundamentals
 Functions are self-contained chunks of code that perform a **specific task**. A function is defined by a name by which we can call it by. It can take inputs known as **parameters** and it performs some kind of operation in its *scope* or *block*. A function can optionally return some kind of output after its operation. Functions help to reduce complexity in our code and make our code more reusable.
 
    let firstName = "Jane"
    let lastName = "Doe"
    func createFullName(firstName: String, lastName: String) -> String {
        return firstName + " " + lastName
    }
 
 ![factory](factory.png)
 
 Functions can come with both **arguement labels** and **parameter names**. The arguement label is used when calling the function. The parameter name is used in the implementation of the function. Using arguement labels and parameter names makes our code more readable.
 
    var numberOfStudents = 30
    func add(studentsCount count: Int) {
        numberOfStudents += count
    }
    add(studentsCount: 5)
 
 Function parameters are constants by default. If you wish to change the value of a parameter inside of a function then you need to define it as an **in-out parameter**. This is done by placing the `inout` keyword before the parameter's type. You only pass a variable as the arguement for an in-out parameter.
 
    func addNumber(toName name: inout String) -> String {
        name = name + "123"
        return name
    }
    var name = "Paul"
    addNumber(toName: &name)
 
*/
//: [Next](@next)



let firstName = "Ben"
let lastName = "Smith"

func fullName(firstName: String, lastName: String) -> String? {
    if firstName == "Tom" {
        return nil
    }
    return "This is the full name: \(firstName) \(lastName)"
}

let fullNameResult = fullName(firstName: firstName, lastName: lastName)

if let fullNameResult = fullNameResult {
    print("This is the fullName \(fullNameResult)")
} else {
    print("There is no fullName")
}

func guardCheck() {
    guard let fullNameResult = fullName(firstName: firstName, lastName: lastName) else {
        print("variable not found")
        return
    }
}

guardCheck()



var number = 5

func newNum(to changeNumber: inout Int) {
    changeNumber += 1
}

newNum(to: &number)

print(number)
