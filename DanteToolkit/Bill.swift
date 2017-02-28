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
    
    public func getGrandTotal() -> Double {
        let grandTotal = calculateSubChargesAmount() + tax.getMonetaryAmount() + tip.getMonetaryAmount()
        return grandTotal.roundTo(sigFigs: CalcSettings.sigFigs)
    }
    
    public func readBill() {
        print("Currently, there are \(subCharges.count) subcharges")
        var subChargeCount = 1
        var calculatedGT = 0.0
        for sub in subCharges {
            print("=========== SubCharge \(subChargeCount) ===========")
            print("Amount: \(sub.printableTotalAmount())")
            let taxShare = sub.getMonetaryAmount() * tax.getPercent()
            let tipShare = sub.getMonetaryAmount() * tip.getPercent()
            let taxSig = taxShare.roundTo(sigFigs: CalcSettings.sigFigs)
            let tipSig = tipShare.roundTo(sigFigs: CalcSettings.sigFigs)
            print("Tax Share: \(taxSig)")
            print("Tip Share: \(tipSig)")
            var grandTotalShare = sub.getMonetaryAmount() + taxSig + tipSig
            grandTotalShare = grandTotalShare.roundTo(sigFigs: CalcSettings.printSigFigs)
            print("GrandTotal Share: \(grandTotalShare)")
            calculatedGT +=  grandTotalShare
            subChargeCount += 1
        }
        print("====================================")
        print("Subtotal:   \(calculateSubChargesAmount())")
        print("Tax:        \(tax.printableTotalAmount()) (\(tax.printablePercent()))")
        print("Tip:        \(tip.printableTotalAmount()) (\(tip.printablePercent()))")
        print("GrandTotal: \(getGrandTotal())")
        //print("Calculated Grand Total: \(calculatedGT)")
        print("====================================")
    }
}
