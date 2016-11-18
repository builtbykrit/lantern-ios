//
//  HomeViewModelTests.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

@testable import Lantearn
import XCTest

class HomeViewModelTests: XCTestCase {
    
    let viewModel = HomeViewModel(expenseDataSource: [Expense](), incomeDataSource: [Income]())
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: UITableViewDataSource
    
    func testNumberOfSections() {
        let numSections = viewModel.numberOfSections()
        XCTAssertEqual(2, numSections)
    }
    
   
    func testNumberOfRowsInBudgetSection() {
        
        let numRows = viewModel.numberOfRowsInSection(HomeSection.budget.rawValue)
        XCTAssertEqual(2, numRows)
    }
    
    func testNumberOfRowsInForecastSection() {
        
        let numRows = viewModel.numberOfRowsInSection(HomeSection.forecast.rawValue)
        XCTAssertEqual(3, numRows)
    }
    
    func testNumberOfRowsInInvalidSection() {
        
        let numRows = viewModel.numberOfRowsInSection(2)
        XCTAssertEqual(0, numRows)
    }
    
    //TODO: Set income and expenses datasource and test values
    
    func testRowTextMonthlyExpensesForIndexPath() {
        let indexPath = IndexPath(row: BudgetRow.monthlyExpenses.rawValue, section: HomeSection.budget.rawValue)
        let data = viewModel.rowDataForIndexPath(indexPath)
        XCTAssertEqual("Monthly Expenses", data.name)
        XCTAssertEqual("0", data.value)
    }
    
    func testRowTextMonthlyIncomeForIndexPath() {
        let indexPath = IndexPath(row: BudgetRow.monthlyIncome.rawValue, section: HomeSection.budget.rawValue)
        let data = viewModel.rowDataForIndexPath(indexPath)
        XCTAssertEqual("Monthly Income", data.name)
        XCTAssertEqual("0", data.value)
    }
    
    func testRowText3MonthsForIndexPath() {
        let indexPath = IndexPath(row: ForecastRow.threeMonths.rawValue, section: HomeSection.forecast.rawValue)
        let data = viewModel.rowDataForIndexPath(indexPath)
        XCTAssertEqual("3 Months", data.name)
        XCTAssertEqual("0", data.value)
    }
    
    func testRowText6MonthsForIndexPath() {
        let indexPath = IndexPath(row: ForecastRow.sixMonths.rawValue, section: HomeSection.forecast.rawValue)
        let data = viewModel.rowDataForIndexPath(indexPath)
        XCTAssertEqual("6 Months", data.name)
        XCTAssertEqual("0", data.value)
    }
    
    func testRowText12MonthsForIndexPath() {
        let indexPath = IndexPath(row: ForecastRow.twelveMonths.rawValue, section: HomeSection.forecast.rawValue)
        let data = viewModel.rowDataForIndexPath(indexPath)
        XCTAssertEqual("12 Months", data.name)
        XCTAssertEqual("0", data.value)
    }
    
    func testRowTextInvalidForIndexPath() {
        let indexPath = IndexPath(row: 5, section: 4)
        let data = viewModel.rowDataForIndexPath(indexPath)
        XCTAssertEqual("Item", data.name)
        XCTAssertEqual("0", data.value)
    }
    
    //MARK: UITableViewDelegate
    
    func testBudgetSectionHeaderforSection() {
        let text = viewModel.headerTextForSection(HomeSection.budget.rawValue)
        
        XCTAssertEqual("Monthly Cash Flow: $0", text)
    }
    
    func testBudgetSectionHeaderWithIncome() {
        let incomeItem = Income(name: "Job", amount: 2000)
        viewModel.incomeDataSource = [incomeItem]
        
        let text = viewModel.headerTextForSection(HomeSection.budget.rawValue)
        XCTAssertEqual("Monthly Cash Flow: $2000", text)
    }
    
    func testBudgetSectionHeaderWithExpense() {
        let expenseItem = Expense(name: "Rent", amount: 1200)
        viewModel.expenseDataSource = [expenseItem]
        
        let text = viewModel.headerTextForSection(HomeSection.budget.rawValue)
        XCTAssertEqual("Monthly Cash Flow: $-1200", text)
    }
    
    func testBudgetSectionHeaderWithBoth() {
        let incomeItem = Income(name: "Job", amount: 2000)
        viewModel.incomeDataSource = [incomeItem]
        let expenseItem = Expense(name: "Rent", amount: 1200)
        viewModel.expenseDataSource = [expenseItem]
        
        let text = viewModel.headerTextForSection(HomeSection.budget.rawValue)
        XCTAssertEqual("Monthly Cash Flow: $800", text)
    }
    
    func testForecastSectionHeaderForSection() {
        let text = viewModel.headerTextForSection(HomeSection.forecast.rawValue)
        XCTAssertEqual("Forecast", text)
    }
    
    func testDidSelectMonthlyExpensesRow() {
        let result = viewModel.didSelectRowAtIndexPath(IndexPath(row: BudgetRow.monthlyExpenses.rawValue, section: HomeSection.budget.rawValue))
        XCTAssertTrue(result)
    }
    
    func testDidSelectMonthlyIncomeRow() {
        let result = viewModel.didSelectRowAtIndexPath(IndexPath(row: BudgetRow.monthlyIncome.rawValue, section: HomeSection.budget.rawValue))
        XCTAssertTrue(result)
    }
    
    func testDidSelectRowInForecast() {
        let result = viewModel.didSelectRowAtIndexPath(IndexPath(row:ForecastRow.sixMonths.rawValue, section: HomeSection.forecast.rawValue))
        XCTAssertFalse(result)
    }

    
}
