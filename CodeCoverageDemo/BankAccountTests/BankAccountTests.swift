//
//  BankAccountTests.swift
//  BankAccountTests
//
//  Created by Pranav Manikpure on 13/11/25.
//

import XCTest
@testable import CodeCoverageDemo

final class BankAccountTests: XCTestCase {
    
    func test_should_deposit_amount_successfully() {
        
        let bankAccount = BankAccount(accountNumber: "1122", balance: 100)
        bankAccount.deposit(200)
        XCTAssertEqual(300, bankAccount.balance)
    }
    
    func test_should_withdraw_amount_successfully() {
        let bankAccount = BankAccount(accountNumber: "1122", balance: 300)
        try! bankAccount.withdraw(200)
        XCTAssertEqual(bankAccount.balance, 100)
    }
    
    func test_should_check_insufficient_funds() {
        let bankAccount = BankAccount(accountNumber: "1122", balance: 100)
        XCTAssertThrowsError(try bankAccount.withdraw(200), "") { error in
            XCTAssertEqual(error as! BankAccountError, BankAccountError.insufficientFunds)
        }
    }
}
