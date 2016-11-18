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
    case cashFlow
    case threeMonths
    case sixMonths
    case twelveMonths
    
    static let enumerate = [cashFlow, threeMonths, sixMonths, twelveMonths]
}


class HomeViewModel {
    
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
                    case .cashFlow:
                        return NSLocalizedString("home.forecast.flow", comment: "")
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
}
