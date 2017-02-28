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
    private var items: [Item] = []
    
    init(name: String) {
        self.name = name
    }
    
    public func getName() -> String {
        return name
    }
    
    public func changeName(newName: String) {
        self.name = newName
    }
    
    public func addItem(itemName: String, itemPrice: Double) {
        let item = Item(name: itemName, price: itemPrice)
        items.append(item)
    }
    
    public func calculateTotal() -> Double {
        var total = 0.0
        for item in items {
            total += item.price
        }
        return total.roundTo(sigFigs: CalcSettings.moneySigFigs)
    }
    
}
