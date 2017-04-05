//
//  Item2.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Item2 {
    
    private var name: String
    private var value: Double
    private var itemOwner: Person2?
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    public func assignOwner(newOwner: Person2) {
        self.itemOwner = newOwner
    }
}
