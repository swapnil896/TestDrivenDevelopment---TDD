//
//  ContentViewPage.swift
//  TipCalculator
//
//  Created by Swapnil Magar on 12/11/25.
//

import Foundation
import XCTest

class ContentViewPage {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var totalTextField: XCUIElement {
        app.textFields[AccessibilityID.totalTextField]
    }
    
    var calculateTipButton: XCUIElement {
        app.buttons[AccessibilityID.calculateTipButton]
    }
    
    var tipPercentageSegmentedControl: XCUIElement {
        app.segmentedControls[AccessibilityID.tipPercentSegmentControl]
    }
    
    var tipText: XCUIElement {
        app.staticTexts[AccessibilityID.tipText]
    }
    
    var messageText: XCUIElement {
        app.staticTexts[AccessibilityID.messageText]
    }
}
