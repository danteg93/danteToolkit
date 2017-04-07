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
//        if !billHasItem(item) { return nil }
//        if let owner = itemHasOwner(item) {
//            owner
//        }
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
    
}
