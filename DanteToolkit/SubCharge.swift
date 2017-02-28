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
    
    private let sigFigs = CalcSettings.sigFigs
    private let printSigFigs = CalcSettings.printSigFigs

    init(subAmount: Double, totalAmount: Double) {
        self.monetaryAmount = subAmount
        self.grandTotalAmount = totalAmount
        let unroundedPercent = (subAmount / totalAmount)
        self.percentOfTotal = unroundedPercent.roundTo(sigFigs: sigFigs)
    }
    
    public func getPercent() -> Double {
        return percentOfTotal
    }
    
    public func printablePercent() -> String {
        return String("\(percentOfTotal.roundTo(sigFigs: printSigFigs))%")
    }
    
    public func getMonetaryAmount() -> Double {
        return monetaryAmount.roundTo(sigFigs: sigFigs)
    }
    
    public func printableTotalAmount() -> String {
        return String(monetaryAmount.roundTo(sigFigs: CalcSettings.printSigFigs))
    }
}
