//
//  HomeViewControllerTests.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

@testable import Lantearn
import XCTest

class HomeViewControllerTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTapMonthlyExpensesMovesToExpesnses() {
        let app = XCUIApplication()
        
        app.tables.staticTexts["Monthly Expenses"].tap()
        
        XCTAssertTrue(app.navigationBars["Expenses"].exists)
    }
    
    func testTapMonthlyIncomeMovesToExpesnses() {
        let app = XCUIApplication()
        
        app.tables.staticTexts["Monthly Income"].tap()
        
        XCTAssertTrue(app.navigationBars["Income"].exists)
    }
    
    func testTapForecastRowDoesNothing() {
        let app = XCUIApplication()
        
        app.tables.staticTexts["3 Months"].tap()
        
        XCTAssertTrue(app.navigationBars["Lantearn"].exists)
    }
    
}
