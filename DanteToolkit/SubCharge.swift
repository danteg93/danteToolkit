//
//  SubCharge.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class SubCharge {
    var monetaryAmount: Double
    var grandTotalAmount: Double
    var percentOfTotal: Double
    var nameOfCharge: String?
    
    init(subAmount: Double, totalAmount: Double) {
        self.monetaryAmount = subAmount
        self.grandTotalAmount = totalAmount
        self.percentOfTotal = (subAmount / totalAmount)
    }
    
    public func getPercent(significantFigures sigFig: Int) -> Double? {
        if sigFig < 0 && sigFig > 4 {
            return nil
        }
        let exponentialPower = pow(10.0, Double(sigFig))
        return Double(round(exponentialPower*percentOfTotal)/exponentialPower)
    }
    
    public func getMonetaryAmount() -> Double {
        return Double(round(10000*monetaryAmount)/10000)
    }
    
    public func printableAmount() -> String {
        return String(Double(round(100*monetaryAmount)/100))
    }
}
