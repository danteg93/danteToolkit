//
//  Item.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Item {
    public var name: String
    public var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price.roundTo(sigFigs: CalcSettings.moneySigFigs)
    }
    
    public func splitItem(parts: Int) {
        let splitAmount = price / Double(parts)
        
    }
    
}
