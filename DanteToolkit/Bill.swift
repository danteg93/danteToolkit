//
//  Bill.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 4/4/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

class Bill {
    
    public private(set) var name = "Bill"
    public private(set) var primaryItems: [Item] = []
    public private(set) var superItems: [Item] = []
    
    public func addPrimaryItem(item: Item) {
        primaryItems.append(item)
    }
    
    public func removePrimaryItem(itemIndex: Int) {
        if itemIndex >= primaryItems.count {
            return
        }
        primaryItems.remove(at: itemIndex)
    }
    
    public func addSuperItem(item: Item) {
        superItems.append(item)
    }
    
    public func removeSuperItem(item: Item) {
        var index = 0
        for _item in superItems {
            if _item.getId() == item.getId() {
                item.removeOwner()
                superItems.remove(at: index)
                return
            }
            index += 1
        }
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
