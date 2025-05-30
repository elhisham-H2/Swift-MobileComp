//
//  main.swift
//  Bank Account
//
//  Created by Hisham El-Shiraida on 2025-05-30.
//

print("Welcome to Bank of H2!")

func Menu() {
    print("What service would you like to use today?")
    print("""
Please select an option:
1: Check balance
2: Deposit
3: Withdraw
4: Exit
""")
}

let account : BankAccount =  BankAccount(accountNum : 0000, balance : 0.00)
var stop = false
while !stop{
    Menu()
    
    if let option = readLine() {
        switch option {
        case "1":
            print("Your balance is $\(String(format: "%.2f", account.DisplayBalance()))")
        case "2":
            print("How much would you like to deposit?")
            if let input = readLine(), let depositAmount = Double(input) {
                let newBalance = account.Deposit(amount: depositAmount)
                print("You deposited $\(String(format: "%.2f", depositAmount))")
                print("New balance: $\(String(format: "%.2f", newBalance))")
            } else {
                print("Invalid deposit amount.")
            }
        case "3":
            print("How much would you like to withdraw?")
            if let input = readLine(), let withdrawAmount = Double(input) {
                let newBalance = account.Withdraw(amount: withdrawAmount)
                print("You withdrew $\(String(format: "%.2f", withdrawAmount))")
                print("New balance: $\(String(format: "%.2f", newBalance))")
            } else {
                print("Invalid withdrawal amount.")
            }
        case "4":
            print("Thank you for banking with Bank of H2!")
            stop = true
        default:
            print("Invalid input")
        }
    }
}
