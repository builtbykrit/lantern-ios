//
//  BudgetItemsViewController.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

import UIKit

class BudgetItemsViewController: UIViewController {

    var viewModel: BudgetItemsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Setuo
    
    func setupTitle() {
        switch viewModel.budgetRow {
        case .monthlyIncome:
            title = NSLocalizedString("navigation.title.income", comment: "")
        case .monthlyExpenses:
            title = NSLocalizedString("navigation.title.expenses", comment: "")
        }
    }
    


}
