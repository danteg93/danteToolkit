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
    
    private let mathSigFigs = CalcSettings.mathSigFigs
    private let moneySigFigs = CalcSettings.moneySigFigs

    init(subAmount: Double, totalAmount: Double) {
        self.monetaryAmount = subAmount.roundTo(sigFigs: mathSigFigs)
        self.grandTotalAmount = totalAmount.roundTo(sigFigs: mathSigFigs)
        let unroundedPercent = (subAmount / totalAmount)
        self.percentOfTotal = unroundedPercent.roundTo(sigFigs: mathSigFigs)
    }
    
    public func calculateShare(percentage: Double) -> Double {
        return (monetaryAmount * percentage).roundTo(sigFigs: mathSigFigs)
    }
    
    public func getPercent() -> Double {
        return percentOfTotal.roundTo(sigFigs: mathSigFigs)
    }
    
    public func printablePercent() -> String {
        let expandedPercent = percentOfTotal * 100.0
        return String("\(expandedPercent.roundTo(sigFigs: moneySigFigs))%")
    }
    
    public func getMonetaryAmount() -> Double {
        return monetaryAmount.roundTo(sigFigs: mathSigFigs)
    }
    
    public func printableTotalAmount() -> String {
        return String(monetaryAmount.roundTo(sigFigs: moneySigFigs))
    }
}
