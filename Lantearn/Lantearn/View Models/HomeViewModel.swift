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

enum ForecastRow: Int {
    case threeMonths
    case sixMonths
    case twelveMonths
    
    static let enumerate = [threeMonths, sixMonths, twelveMonths]
}


class HomeViewModel {
    
    fileprivate var cashFlow:Int {
        let expense = expenseDataSource.reduce(0) { $0 + $1.amount }
        let income = incomeDataSource.reduce(0) { $0 + $1.amount }
        return income - expense
    }
    
    var expenseDataSource: [Expense]
    var incomeDataSource: [Income]
    
    init(expenseDataSource: [Expense], incomeDataSource: [Income]) {
        self.expenseDataSource = expenseDataSource
        self.incomeDataSource = incomeDataSource
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        if let section = HomeSection(rawValue: section) {
            switch section {
            case .budget:
                return BudgetRow.enumerate.count
            case .forecast:
                return ForecastRow.enumerate.count
            }
        }
        
        return 0
    }
    
    func numberOfSections() -> Int {
        return HomeSection.enumerate.count
    }
    
    //MARK: UITableViewDelegate
    
    func rowTextForIndexPath(_ indexPath: IndexPath) -> String {
        if let section = HomeSection(rawValue: indexPath.section) {
            switch section {
            case .budget:
                if let row = BudgetRow(rawValue: indexPath.row) {
                    switch row {
                    case .monthlyExpenses:
                        return NSLocalizedString("home.budget.expenses", comment: "")
                    case .monthlyIncome:
                        return NSLocalizedString("home.budget.income", comment: "")
                    }
                }
            case .forecast:
                if let row = ForecastRow(rawValue: indexPath.row) {
                    switch row {
                    case .threeMonths:
                        return NSLocalizedString("home.forecast.three", comment: "")
                    case .sixMonths:
                        return NSLocalizedString("home.forecast.six", comment: "")
                    case .twelveMonths:
                        return NSLocalizedString("home.forecast.twelve", comment: "")
                    }
                }
            }
        }
        
        return ""
    }
    
    func headerTextForSection(_ section: Int) -> String {
        if let section = HomeSection(rawValue: section) {
            switch section {
            case .budget:
                return String(format: NSLocalizedString("home.budget.header", comment: ""), cashFlow)
            case .forecast:
                return NSLocalizedString("home.forecast.header", comment: "")
            }
        }
        
        return ""
    }
}
