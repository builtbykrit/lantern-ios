//
//  Income.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

import Foundation

struct Income: BudgetItem {
    
    var amount: Int
    var name: String
    
    init() {
        name = "Income Item"
        amount = 0
    }
}
