//
//  Bill2.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Bill2 {
    
    public private(set) var name = "Bill"
    public private(set) var primaryItems: [Item2] = []
    public private(set) var superItems: [Item2] = []
    
    public func addPrimaryItem(item: Item2) {
        primaryItems.append(item)
    }
    
    public func removePrimaryItem(itemIndex: Int) {
        if itemIndex >= primaryItems.count {
            return
        }
        primaryItems.remove(at: itemIndex)
    }
    
    public func addSuperItem(item: Item2) {
        superItems.append(item)
    }
    
    public func removeSuperItem(itemIndex: Int) {
        if itemIndex >= superItems.count {
            return
        }
        superItems.remove(at: itemIndex)
    }
    
    public func getSubTotal() -> Double {
        var total = 0.0
        for item in primaryItems {
            total += item.getValue()
        }
        return total
    }
    
    public func getSuperItemsTotal() -> Double {
        var total = 0.0
        for item in superItems {
            total += item.getValue()
        }
        return total
    }
    
    public func getTotal() -> Double {
        return getSubTotal() + getSuperItemsTotal()
    }
}
