//
//  BudgetItem.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

import Foundation

protocol BudgetItem {
    var amount: Int {get set}
    var name: String {get set}
    
    init()
    init(name: String, amount: Int)

}

extension BudgetItem {
    init(name: String, amount: Int) {
        self.init()
        self.amount = amount
        self.name = name
    }
}
