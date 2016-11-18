//
//  Forecast.swift
//  Lantearn
//
//  Created by Kevin Hoffman on 11/18/16.
//  Copyright © 2016 kehoffman3. All rights reserved.
//

import Foundation

struct Forecast {
    
    var threeMonths: Int
    var sixMonths: Int
    var tweleveMonths: Int
    
    init() {
        self.threeMonths = 0
        self.sixMonths = 0
        self.tweleveMonths = 0
    }
    
    init(cashFlow: Int) {
        threeMonths = cashFlow * 3
        sixMonths = cashFlow * 6
        tweleveMonths = cashFlow * 12
    }
    
}

enum ForecastRow: Int {
    case threeMonths
    case sixMonths
    case twelveMonths
    
    static let enumerate = [threeMonths, sixMonths, twelveMonths]
}
