//
//  BillManager.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class BillManager  {
    
    private var bill:Bill2
    private var people: [Person2]
    
    init(bill: Bill2, people: [Person2]) {
        self.bill = bill
        self.people = people
    }
    
    private func calculateCharges() {
        for person in people {
            
        }
    }
    
    private func validateBill() -> (Bool, Int) {
        for item in bill.primaryItems {
            if item.ownerId == nil {
                return (false, item.getId())
            }
        }
        return (true, -1)
    }
    
}
