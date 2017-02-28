//
//  Person.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Person {
    private var name: String
    private var amountPaid: Double
    
    init(name: String, amountPaid: Double) {
        self.name = name
        self.amountPaid = amountPaid
    }
    
    public func getName() -> String {
        return name
    }
    public func changeName(newName: String) {
        self.name = newName
    }
    public func changeAmountPaid(newAmount: Double) {
        self.amountPaid = newAmount
    }
    
}
