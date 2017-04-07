//
//  Person.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Person {
    
    static var idCount = 0
    
    public var name = "Person"
    private var id: Int
    public private(set) var items: [Item] = []
    
    init() {
        self.id = Person.idCount
        Person.idCount += 1
    }
    
    init(name: String) {
        self.id = Person.idCount
        Person.idCount += 1
        self.name = name
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
    
    public func addItem(item: Item) {
        item.setOwnerId(id: self.id)
        self.items.append(item)
    }
    
    public func removeItem(item: Item) {
        var index = 0
        for _item in items {
            if _item.getId() == item.getId() {
                item.removeOwner()
                items.remove(at: index)
                return
            }
            index += 1
        }
    }
    
    public func getAmountOwed() -> Double {
        var amount = 0.0
        for item in items {
            amount += item.getValue()
        }
        return amount
    }
}
