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
    
}
