//
//  Item2.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Item2 {
    
    static var idCount = 0
    
    public var name: String = "Item"
    private var id: Int
    private var value: Double
    public private(set) var ownerId: Int?
    
    init(value: Double) {
        self.id = Item2.idCount
        Item2.idCount += 1
        self.value = value
    }
    
    public func setOwnerId(id: Int) {
        ownerId = id
    }
    
    public func getId() -> Int {
        return self.id
    }
    
    public func getValue() -> Double {
        return value
    }
}
