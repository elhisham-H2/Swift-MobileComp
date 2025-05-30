//
//  BankAccountClass.swift
//  Bank Account
//
//  Created by Hisham El-Shiraida on 2025-05-30.
//

import Foundation

public class BankAccount {
    let accountNum: Int
    var balance: Double
    
    init(accountNum : Int, balance : Double) {
        self.accountNum = accountNum
        self.balance = balance
    }
    
    func DisplayBalance() -> Double {
        return balance
        
    }
    func Deposit(amount : Double) {
            balance += amount
        }
    func Withdraw(amount : Double) {
            balance -= amount
        }
    
}
