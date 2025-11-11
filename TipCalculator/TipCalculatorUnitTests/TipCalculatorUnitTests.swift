//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Swapnil Magar on 11/11/25.
//

import XCTest

final class TipCalculatorUnitTests: XCTestCase {

    func test_should_calculate_tip_successfully() {
        
        let tipCalculator = TipCalculator()
        let tip = try! tipCalculator.calculate(total: 100, tipPercentage: 0.1)
        XCTAssertEqual(tip, 10)
    }
    
    func test_should_throw_invalid_exception() {
        
        let tipCalculator = TipCalculator()
        XCTAssertThrowsError(try tipCalculator.calculate(total: -100, tipPercentage: 0.1), "") { error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
        }
        
    }
}
