//: [Previous](@previous)
/*:
 ## Properties
 
 ### Stored Properties
 These are the typical variables and constants of a class or structure.They are referred to as stored properties because they are store a value. Stored properties can utilise observors to respond to changes in the property's value. We use:
 **willSet** to respond to a new value before it is set.
 **didSet** to respond to a new value after it has been set.
 
 ### Lazy Properties
 A lazy property is a stored property whose value is not calculated until the first time it is used. This is useful when:
 * the intial value depends on some other factors.
 * the initialization is computationally expensive.
 
 ### Property Observors
 Property observors respond to changes in the properties values.
 * `willSet` is called just before the value is stored
 * `didSet` is called after the new value is stored
 
 ### Computed Properties
 Computed properties 'compute' their values. They define at minimum a getter to retrieve their value and an optional setter to retrieve and set other properties indirectly. Computed properties do not store any values.
 
 ### Type Properties
Type properties define values that belong to the type itself and not to any instance. This means a typed property defines a value universal to all instances of a particular type.
 
*/

struct User {
    var name: String
    var funds: Double
}

class Account {
    
    static var numberOfAccounts = 0
    
    lazy var isWithdrawable: Bool = {
        if funds <= 0 {
            return false
        }
        
        return true
    }()
    
    var user: User
    var funds: Double {
        willSet {}
        didSet {
            if funds <= 0 {
                funds = 0
            }
        }
    }
    let withdrawLimit = 1000.0
    
    var withdrawable: Double {
        if funds <= 0.0 {
            return 0.0
        } else if funds >= withdrawLimit {
            return withdrawLimit
        }
        
        return funds
    }
    
    var userName: String {
        get {
            return user.name
        }
        set(newName) {
            if newName.count >= 15 {
                nameChangeTooLong()
                return
            }
            user.name = newName
            nameChangedSuccessfully()
        }
    }
    
    init(user: User) {
        self.user = user
        funds = user.funds
        Account.numberOfAccounts += 1
    }
    
    func nameChangeTooLong() {
        print("The new name was too long!")
    }
    
    func nameChangedSuccessfully() {
        print("The name changed successfully")
    }
}

let user = User(name: "Den", funds: 3.0)
let account = Account(user: user)
print("The number of accounts is: \(Account.numberOfAccounts)")
let user2 = User(name: "Ben", funds: 120.0)
let account2 = Account(user: user2)
print("The number of accounts is: \(Account.numberOfAccounts)")

print("we can withdraw \(account.withdrawable)")

account.userName = "alsjkdhasjklhdljkasd"
print("This is the account userName \(account.userName)")

account.userName = "Zeeshan"
print("This is the account userName \(account.userName)")

let user3 = User(name: "Paul", funds: -120.0)
let account3 = Account(user: user3)

print("this is the account 3 status \(account3.isWithdrawable)")
//: [Next](@next)
