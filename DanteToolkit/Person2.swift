//
//  Person2.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Person2 {
    
    static var idCount = 0
    
    public var name = "Person"
    private var id: Int
    private var items: [Item2] = []
    
    init() {
        self.id = Person2.idCount
        Person2.idCount += 1
    }
    
    init(name: String) {
        self.id = Person2.idCount
        Person2.idCount += 1
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
    
    public func getAmountOwed() -> Double {
        var amount = 0.0
        for item in items {
            amount += item.getValue()
        }
        return amount
    }
}
