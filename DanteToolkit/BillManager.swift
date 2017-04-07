//
//  BillManager.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class BillManager  {
    
    private var bill:Bill
    private var people: [Person]
    
    init(bill: Bill, people: [Person]) {
        self.bill = bill
        self.people = people
    }
    
    public func calculateCharges() {
        if !validateBill().validated {
            print("ERROR VALIDATING BILL")
            return
        }
        for person in people {
            let amountOfSubtotal = person.getAmountOwed()
            let subTotal = bill.getSubTotal()
            let ratioOwed = amountOfSubtotal / subTotal
            let totalOwed = bill.getTotal() * ratioOwed
            print("\(person.getName()) ownes: \(totalOwed)")
        }
    }
    
    private func validateBill() -> (validated: Bool, unownedItem: Int) {
        for item in bill.primaryItems {
            if item.ownerId == nil {
                return (false, item.getId())
            }
        }
        return (true, -1)
    }
    
    public func splitItem(item: Item, inParts parts: Int) -> [Item]? {
        if parts <= 1 { return nil }
        if !billHasItem(item) { return nil }
        if let owner = itemHasOwner(item) {
            owner.removeItem(item: item)
        }
        return nil
    }
    
    private func billHasItem(_ item: Item) -> Bool {
        for _item in bill.primaryItems {
            if item.getId() == _item.getId() {
                return true
            }
        }
        return false
    }
    
    private func itemHasOwner(_ item: Item) -> Person? {
        for person in people {
            for _item in person.items {
                if _item.getId() == item.getId() {
                    return person
                }
            }
        }
        return nil
    }
    /*
    public func splitItem(parts: Int) -> [Item]? {
        if parts <= 1 {
            return nil
        }
        let splitAmount = (price / Double(parts)).roundTo(sigFigs: CalcSettings.moneySigFigs)
        var splitPartsTotal = 0.0
        for _ in 1 ... parts {
            splitPartsTotal += splitAmount
        }
        var leftOverAmount = 0.0
        if splitPartsTotal != price {
            leftOverAmount = price - splitPartsTotal
        }
        let extraPennySign = leftOverAmount / abs(leftOverAmount)
        var extraMoneyPool = abs(leftOverAmount).roundTo(sigFigs: CalcSettings.moneySigFigs)
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
        return newItems
    }
 */
}
