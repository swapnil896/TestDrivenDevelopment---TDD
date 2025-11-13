//
//  ContentViewPage.swift
//  MockingDemo
//
//  Created by Swapnil Magar on 13/11/25.
//

import Foundation
import XCTest

class ContentViewPage {
    
    private var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var usernameTextField: XCUIElement {
        app.textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        app.textFields["passwordTextField"]
    }
    
    var loginButton: XCUIElement {
        app.buttons["loginButton"]
    }
    
    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }
    
    var dashboardText: XCUIElement {
        app.staticTexts["dashboard"]
    }
}
