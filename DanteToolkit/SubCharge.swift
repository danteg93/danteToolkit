//
//  SubCharge.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class SubCharge {
    private var monetaryAmount: Double
    private var grandTotalAmount: Double
    private var percentOfTotal: Double
    private var nameOfCharge: String?
    
    private let sigFigs = CalcSettings.sigFigs
    private let printSigFigs = CalcSettings.printSigFigs

    init(subAmount: Double, totalAmount: Double) {
        self.monetaryAmount = subAmount.roundTo(sigFigs: sigFigs)
        self.grandTotalAmount = totalAmount.roundTo(sigFigs: sigFigs)
        let unroundedPercent = (subAmount / totalAmount)
        self.percentOfTotal = unroundedPercent.roundTo(sigFigs: sigFigs)
    }
    
    public func calculateShare(percentage: Double) -> Double {
        return (monetaryAmount * percentage).roundTo(sigFigs: sigFigs)
    }
    
    public func getPercent() -> Double {
        return percentOfTotal.roundTo(sigFigs: sigFigs)
    }
    
    public func printablePercent() -> String {
        let expandedPercent = percentOfTotal * 100.0
        return String("\(expandedPercent.roundTo(sigFigs: printSigFigs))%")
    }
    
    public func getMonetaryAmount() -> Double {
        return monetaryAmount.roundTo(sigFigs: sigFigs)
    }
    
    public func printableTotalAmount() -> String {
        return String(monetaryAmount.roundTo(sigFigs: CalcSettings.printSigFigs))
    }
}
