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
            print("ERROR VALIDATING BILL \(validateBill().unownedItem)")
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
        if parts <= 1 {
            print("splitItem parts < 1")
            return nil
        }
        if !billHasItem(item) {
            print("BILL D.N.C.I.")
            return nil
        } else {
            bill.removePrimaryItem(item: item)
        }
        if let owner = itemHasOwner(item) {
            print("Removing owner tbh: \(owner.getName())")
            owner.removeItem(item: item)
        }
        let itemsSplit = determineSplitItems(item: item, parts: parts)
//        for itemPart in itemsSplit {
//            bill.addPrimaryItem(item: itemPart)
//        }
        return determineSplitItems(item: item, parts: parts)
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
    private func determineSplitItems(item: Item, parts: Int) -> [Item] {
        let splitAmount = (item.getValue() / Double(parts)).roundTo(sigFigs: 2)
        let splitPartsTotal = splitAmount * Double(parts)
        var leftOverAmount = 0.0
        if splitPartsTotal != item.getValue() {
            leftOverAmount = item.getValue() - splitPartsTotal
        }
        if leftOverAmount == 0.0 {
            var tempItems:[Item] = []
            for _ in 1 ... parts {
                let item = Item(value: splitAmount)
                tempItems.append(item)
            }
            return tempItems
        }
        let extraPennySign = leftOverAmount / abs(leftOverAmount)
        var extraMoneyPool = abs(leftOverAmount).roundTo(sigFigs: 2)
        var tempItems:[Item] = []
        for _ in 1 ... parts {
            var extraAmount = 0.0
            if extraMoneyPool > 0.0 {
                extraAmount = 0.01 * extraPennySign
                extraMoneyPool -= 0.01
            }
            let newAmount = splitAmount + extraAmount
            let tempItem = Item(value: newAmount)
            tempItems.append(tempItem)
        }
        return tempItems
    }
}
