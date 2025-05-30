import Cocoa

// Data types
var greeting = "Hello, playground"
print(greeting)

var number = 9
print(number)
var number2: Int = 8
print(number2)
let vlaue = 9.0

var stringNumber = "19"

var newNumber :Int? = Int(stringNumber)

print(newNumber!)

if let v = newNumber {
    print("newNumber = \(String(describing: v))")
}else {
    print("newNumber is nil")
}

if(newNumber != nil){
    print("newNumber = \(newNumber ?? 0)")
}

// selection

var a = 5
var b = 10


if a > b {
    print("a is greater than b")
}else if a < b {
    print("a is less than b")
}else {
    print("a is equal to b")
}


