//
//  MockingDemoUITests.swift
//  MockingDemoUITests
//
//  Created by Swapnil Magar on 13/11/25.
//

import XCTest

final class MockingDemoUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    private var dashboardViewPage: DashboardViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        dashboardViewPage = DashboardViewPage(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
    }
    

    func test_should_show_error_when_required_fields_are_empty() {
        
        contentViewPage.usernameTextField.tap()
        contentViewPage.usernameTextField.typeText("")
        
        contentViewPage.passwordTextField.tap()
        contentViewPage.passwordTextField.typeText("")
        
        contentViewPage.loginButton.tap()
        XCTAssertEqual(contentViewPage.messageText.label, "Required fields are missing")
    }
    
    func test_should_navigate_to_dashboard_screen_upon_successful_login() {
        
        contentViewPage.usernameTextField.tap()
        contentViewPage.usernameTextField.typeText("testuser")
        
        contentViewPage.passwordTextField.tap()
        contentViewPage.passwordTextField.typeText("Password@123")
        
        contentViewPage.loginButton.tap()
        XCTAssertTrue(dashboardViewPage.dashboardText.waitForExistence(timeout: 0.5))
    }
    
    func test_should_show_error_for_invalid_credentials() {
        
        contentViewPage.usernameTextField.tap()
        contentViewPage.usernameTextField.typeText("testuser")
        
        contentViewPage.passwordTextField.tap()
        contentViewPage.passwordTextField.typeText("wrongpassword")
        
        contentViewPage.loginButton.tap()
        XCTAssertEqual(contentViewPage.messageText.label, "Invalid credentials")
    }
}

        
