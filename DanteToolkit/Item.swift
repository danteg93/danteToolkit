//
//  Item.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Item {
    public var name: String
    public var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price.roundTo(sigFigs: CalcSettings.moneySigFigs)
    }
    
    public func splitItem(parts: Int) {
        if parts <= 1 {
            return
        }
        print("Splitting Item: \(self.name)")
        let splitAmount = (price / Double(parts)).roundTo(sigFigs: CalcSettings.moneySigFigs)
        print("Split amount: \(splitAmount)")
        var splitPartsTotal = 0.0
        for _ in 1 ... parts {
            splitPartsTotal += splitAmount
        }
        print("Split parts total: \(splitPartsTotal)")
        print("Original amount: \(self.price)")
        var leftOverAmount = 0.0
        if splitPartsTotal != price {
            leftOverAmount = price - splitPartsTotal
            print("Left over amount: \(leftOverAmount.roundTo(sigFigs: CalcSettings.moneySigFigs))")
        }
        
        let extraPennySign = leftOverAmount / abs(leftOverAmount)
        var extraMoneyPool = abs(leftOverAmount).roundTo(sigFigs: CalcSettings.moneySigFigs)
        print("extra money pool: \(extraMoneyPool)")
        var newItems:[Item] = []
        for i in 1 ... parts {
            let newName = "\(self.name) part \(i)"
            var extraAmount = 0.0
            if extraMoneyPool > 0.0 {
                extraAmount = 0.01 * extraPennySign
                extraMoneyPool -= 0.01
            }
            let newAmount = splitAmount + extraAmount
            let tempItem = Item(name: newName, price: newAmount)
            newItems.append(tempItem)
        }
        print("======== \(self.name) split as follows: ===============")
        for item in newItems {
            print("===========================")
            print("\(item.name)")
            print("Price: \(item.price)")
        }
        print("===========================")
        
    }
    
}
