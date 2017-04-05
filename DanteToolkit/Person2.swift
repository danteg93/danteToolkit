//
//  Person2.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Person2 {
    
    private var name: String
    private var id: Int
    private var amountOwed = 0.0
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    public func changeName(newName name: String) {
        self.name = name
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getId() -> Int {
        return self.id
    }
    
    public func increaseAmountOwed(_ amountToAdd: Double) -> Double {
        self.amountOwed += amountToAdd
        return self.amountOwed
    }
    
    public func decreaseAmountOwed(_ amountToDecrease: Double) -> Double? {
        let newAmount = (self.amountOwed - amountToDecrease)
        if newAmount < 0.0 {
            return nil
        } else {
            self.amountOwed = newAmount
            return self.amountOwed
        }
    }
}
