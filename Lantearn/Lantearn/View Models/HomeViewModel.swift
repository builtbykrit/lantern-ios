//
//  HomeViewModel.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

import Foundation

enum HomeSection: Int {
    case budget
    case forecast
    
    static let enumerate = [budget, forecast]
}

enum BudgetRow: Int {
    case monthlyExpenses
    case monthlyIncome
    
    static let enumerate = [monthlyExpenses, monthlyIncome]
}

struct RowData {
    var name: String
    var value: String
    
    init() {
        self.name = "Item"
        self.value = "0"
    }
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

class HomeViewModel {
    
    fileprivate var forecast:Forecast = Forecast()
    
    fileprivate var cashFlow:Int {
        get {
            return income - expenses
        } set(newCashFlow) {
            forecast = Forecast(cashFlow: newCashFlow)
        }
    }
    
    fileprivate var income: Int {
        return incomeDataSource.reduce(0) { $0 + $1.amount }
    }
    
    fileprivate var expenses:Int {
        return expenseDataSource.reduce(0) { $0 + $1.amount }
    }
    
    var selectedBudgetRow: BudgetRow?
    var expenseDataSource: [Expense]
    var incomeDataSource: [Income]
    
    init(expenseDataSource: [Expense], incomeDataSource: [Income]) {
        self.expenseDataSource = expenseDataSource
        self.incomeDataSource = incomeDataSource
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        switch section {
        case .budget:
            return BudgetRow.enumerate.count
        case .forecast:
            return ForecastRow.enumerate.count
        }
    }
    
    func numberOfSections() -> Int {
        return HomeSection.enumerate.count
    }
    
    //MARK: UITableViewDelegate
    
    func rowDataForIndexPath(_ indexPath: IndexPath) -> RowData {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return RowData()
        }
        switch section {
        case .budget:
            guard let row = BudgetRow(rawValue: indexPath.row) else {
                return RowData()
            }
            switch row {
            case .monthlyExpenses:
                return RowData(name: NSLocalizedString("home.budget.expenses", comment: ""), value: "\(expenses)")
            case .monthlyIncome:
                return RowData(name: NSLocalizedString("home.budget.income", comment: ""), value: "\(income)")
            }
        case .forecast:
            guard let row = ForecastRow(rawValue: indexPath.row) else {
                return RowData()
            }
            switch row {
            case .threeMonths:
                return RowData(name: NSLocalizedString("home.forecast.three", comment: ""), value: "\(forecast.threeMonths)")
            case .sixMonths:
                return RowData(name: NSLocalizedString("home.forecast.six", comment: ""), value: "\(forecast.sixMonths)")
            case .twelveMonths:
                return RowData(name: NSLocalizedString("home.forecast.twelve", comment: ""), value: "\(forecast.tweleveMonths)")
            }
        }
    }
    
    
    func headerTextForSection(_ section: Int) -> String {
        guard let section = HomeSection(rawValue: section) else {
            return ""
        }
        switch section {
        case .budget:
            return String(format: NSLocalizedString("home.budget.header", comment: ""), cashFlow)
        case .forecast:
            return NSLocalizedString("home.forecast.header", comment: "")
        }
    }
    
    func didSelectRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        guard HomeSection(rawValue: indexPath.section) == .budget else {
            return false
        }
        guard let budgetRow = BudgetRow(rawValue: indexPath.row) else {
            return false
        }
        
        selectedBudgetRow = budgetRow
        return true
    }
    
    //MARK: View Models
    
    func viewModelForBudgetItems() -> BudgetItemsViewModel? {
        guard let budgetRow = selectedBudgetRow else {
            return nil
        }
        switch budgetRow {
        case .monthlyIncome:
            return BudgetItemsViewModel(budgetRow: budgetRow, dataSource: incomeDataSource)
        case .monthlyExpenses:
            return BudgetItemsViewModel(budgetRow: budgetRow, dataSource: expenseDataSource)
        }
    }
}
