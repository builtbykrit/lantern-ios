//
//  BudgetItemsViewModel.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

import Foundation

class BudgetItemsViewModel {
    
    var dataSource: [BudgetItem]
    var budgetRow: BudgetRow
    
    //MARK: Init
    
    init(budgetRow: BudgetRow, dataSource: [BudgetItem]) {
        self.budgetRow = budgetRow
        self.dataSource = dataSource
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfRows() -> Int {
        return dataSource.count
    }
}
