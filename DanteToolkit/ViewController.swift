//
//  ViewController.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        lol()
    }

    private func lol() {
        
        let bill = Bill()
        
        let dante = Person(name: "Dante")
        let sally = Person(name: "Sally")
        
        let tax = Item(value: 3.42)
        let tip = Item(value: 7.00)
        
        let marg = Item(value: 14.00)
        let putin1 = Item(value: (18.0/2))
        let putin2 = Item(value: (18.0/2))
        let goldRush = Item(value: 12.00)
        
        
        bill.addSuperItem(item: tax)
        bill.addSuperItem(item: tip)
    
        bill.addPrimaryItem(item: marg)
        bill.addPrimaryItem(item: putin1)
        bill.addPrimaryItem(item: putin2)
        bill.addPrimaryItem(item: goldRush)
        
        for item in bill.primaryItems {
            print("\(item.name)  -  id:\(item.getId())")
        }
        
        dante.addItem(item: marg)
        dante.addItem(item: putin1)
        sally.addItem(item: putin2)
        sally.addItem(item: goldRush)
        
        
        let billManager = BillManager(bill: bill, people: [dante, sally])
        let items = billManager.splitItem(item: marg, inParts: 2)
        dante.addItem(item: items![0])
        sally.addItem(item: items![1])
        
        bill.addPrimaryItem(item: items![0])
        bill.addPrimaryItem(item: items![1])
        for item in bill.primaryItems {
            print("\(item.name)  -  id:\(item.getId())")
        }
        billManager.calculateCharges()
    }
    
}

