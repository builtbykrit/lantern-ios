//
//  BudgetItemsViewModelTests.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

@testable import Lantearn
import XCTest

class BudgetItemsViewModelTests: XCTestCase {

    let expenseItems = [Expense(name: "Rent", amount: 1000), Expense(name: "Utilities", amount:300)]
    let expenseViewModel = BudgetItemsViewModel(budgetRow: .monthlyExpenses, dataSource: [Expense]())
    
    let incomeItems = [Income(name: "Job", amount: 1500), Income(name: "Side Job", amount: 800), Income(name: "Night Job", amount: 500)]
    let incomeViewModel = BudgetItemsViewModel(budgetRow: .monthlyIncome, dataSource: [Income]())
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    func testNumberOfRowsExpenses() {
        expenseViewModel.dataSource = expenseItems
        let numRows = expenseViewModel.numberOfRows()
        
        XCTAssertEqual(numRows, 2)
    }
    
    func testNumberOfRowsIncome() {
        incomeViewModel.dataSource = incomeItems
        let numRows = incomeViewModel.numberOfRows()
        
        XCTAssertEqual(numRows, 3)
    }
    
}
