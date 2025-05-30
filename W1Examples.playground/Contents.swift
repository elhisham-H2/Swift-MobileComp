import UIKit
import Foundation

var greeting = "Hello, playground"
var oldAge = 18
greeting = "Hello, World!"

print(greeting)
print("Age is \(oldAge)")

print("Age is", oldAge)

var price: Double = 700
var numberOfItems: Int = 3

print("Total price of items: \(price * Double(numberOfItems))")

// write a program that asks the user

print("What is your name?")
if let name = readLine() {
    print("Hello, \(name)!")
}
print("How old are you?")
if let ageString = readLine(), let age = Int(ageString) {
    print("You are \(age) years old.")
}
