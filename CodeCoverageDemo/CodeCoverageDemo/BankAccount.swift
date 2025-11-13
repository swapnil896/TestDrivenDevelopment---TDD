//
//  BankAccount.swift
//  CodeCoverageDemo
//
//  Created by Swapnil Magar on 13/11/25.
//

enum BankAccountError: Error {
    case insufficientFunds
}

class BankAccount {
    
    var accountNumber: String
    var balance: Double
    
    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(_ amount: Double) {
        self.balance += amount
    }
    
    func withdraw(_ amount: Double) throws {
        
        if amount > self.balance {
            throw BankAccountError.insufficientFunds
        }
        
        self.balance -= amount
    }
}
