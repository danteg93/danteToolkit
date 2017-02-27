//
//  Bill.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Bill {
    private var tip: SubCharge
    private var tax: SubCharge
    private var subTotal: Double
    private var subCharges: [SubCharge] = []
    private var leftOverAmount = 0.0
    
    init(subTotal: Double, tax: SubCharge, tip: SubCharge) {
        self.tax = tax
        self.tip = tip
        self.subTotal = subTotal
        addSubCharge(amount: subTotal)
    }
    
    public func getGrandTotal(significantFigures sigFig: Int) -> Double? {
        if sigFig < 0 && sigFig > 4 {
            return nil
        }
        let exponentialPower = pow(10.0, Double(sigFig))
        let grandTotal = calculateSubChargesAmount() + tax.getMonetaryAmount() + tip.getMonetaryAmount()
        return Double(round(exponentialPower*grandTotal)/exponentialPower)
    }
    
    public func addSubCharge(amount: Double) {
        if subCharges.count > 0 {
            subCharges.removeLast()
        }
        let tempSubCharge = SubCharge(subAmount: amount, totalAmount: self.subTotal)
        subCharges.append(tempSubCharge)
        leftOverAmount = subTotal - calculateSubChargesAmount()
        if  leftOverAmount <= 0.0 {
            return
        }
        let leftOverSubCharge = SubCharge(subAmount: leftOverAmount, totalAmount: self.subTotal)
        subCharges.append(leftOverSubCharge)
    }
    
    private func calculateSubChargesAmount() -> Double {
        var subTotal = 0.0
        for subCharge in subCharges {
            subTotal += subCharge.getMonetaryAmount()
        }
        return subTotal
    }
    
    public func readBill() {
        print("Currently, there are \(subCharges.count) subcharges")
        var subChargeCount = 1
        var calculatedGT = 0.0
        for sub in subCharges {
            print("=========== SubCharge \(subChargeCount) ===========")
            print("Amount: \(sub.getMonetaryAmount())")
            let taxShare = sub.getMonetaryAmount() * tax.getPercent(significantFigures: 4)!
            let tipShare = sub.getMonetaryAmount() * tip.getPercent(significantFigures: 4)!
            let taxSig = Double(round(10000*taxShare)/10000)
            let tipSig = Double(round(10000*tipShare)/10000)
            print("Tax Share: \(taxSig)")
            print("Tip Share: \(tipSig)")
            let grandTotalShare = sub.getMonetaryAmount() + taxSig + tipSig
            print("GrandTotal Share: \(Double(round(100*grandTotalShare)/100))")
            calculatedGT += Double(round(100*grandTotalShare)/100)
            subChargeCount += 1
        }
        print("====================================")
        print("Subtotal:   \(calculateSubChargesAmount())")
        print("Tax:        \(self.tax.getMonetaryAmount()) (\(self.tax.getPercent(significantFigures: 4)!*100)%)")
        print("Tip:        \(self.tip.getMonetaryAmount()) (\(self.tip.getPercent(significantFigures: 4)!*100)%)")
        print("GrandTotal: \(getGrandTotal(significantFigures: 4)!)")
        //print("Calculated Grand Total: \(calculatedGT)")
        print("====================================")
    }
}
