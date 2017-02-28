//
//  Person.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Person {
    public var name: String
    public var amountPaid: Double
    
    init() {
        self.name = "Person"
        self.amountPaid = 0.0
    }
    init(name: String) {
        self.name = name
        self.amountPaid = 0.0
    }
    init(amountPaid: Double) {
        self.name = "Person"
        self.amountPaid = amountPaid
    }
    init(name: String, amountPaid: Double) {
        self.name = name
        self.amountPaid = amountPaid
    }
    
}
