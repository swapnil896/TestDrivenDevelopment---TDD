//
//  DashboardViewPage.swift
//  MockingDemo
//
//  Created by Swapnil Magar on 13/11/25.
//

import Foundation
import XCTest

class DashboardViewPage {
    
    private var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var dashboardText: XCUIElement {
        app.staticTexts["Dashboard"]
    }
}
