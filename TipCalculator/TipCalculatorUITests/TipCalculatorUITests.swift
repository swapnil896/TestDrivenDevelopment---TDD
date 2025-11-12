//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Pranav Manikpure on 11/11/25.
//

import XCTest

final class TipCalculatorUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false // says dont continue if app launch fails
        app.launch()
    }

    func test_if_the_total_textfield_contains_default_value() {
        
        let totalTextField = app.textFields["totalTextField"]
        XCTAssertEqual(totalTextField.value as! String, "Enter Total")
    }
    
    func test_if_the_twenty_percent_default_tip_option_is_selected() {
        
        // Selects the Tip Segment control, gets the button at Index 1 and verifies if its label says 20%
        let tipSegmentedControl = app.segmentedControls["tipPercentSegmentControl"]
        let segmentControlButton = tipSegmentedControl.buttons.element(boundBy: 1)
        XCTAssertEqual(segmentControlButton.label, "20%")
        
        // Checks if the segment control button with 20% is selected
        XCTAssertTrue(segmentControlButton.isSelected)
    }
    
    func test_should_be_able_to_calculate_correct_tip_amount() {
        
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("100")
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
        let tipText = app.staticTexts["tipText"]
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        let currentLocale = Locale.current
        if let currencySymbol = currentLocale.currencySymbol {
            let value = currencySymbol + "20.00"
            XCTAssertEqual(tipText.label, value)
        }
    }
    
    func test_should_validate_negative_input_for_amount() {
        
        let totalTextField = app.textFields[AccessibilityID.totalTextField]
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        let calculateTipButton = app.buttons[AccessibilityID.calculateTipButton]
        calculateTipButton.tap()
        
        let messageText = app.staticTexts[AccessibilityID.messageText]
        let _ = messageText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(messageText.label, "Invalid Input")
    }
    
    override func tearDown() {
        // Clean Up code
    }
}
