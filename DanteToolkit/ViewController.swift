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
        
        let tax = Item(value: 1.72)
        let tip = Item(value: 2.0)
        
        let chicken = Item(value: 11.25)
        let kebab = Item(value: 10.95)
        let wine = Item(value: 8.00)
        
        bill.addSuperItem(item: tax)
        bill.addSuperItem(item: tip)
        
        bill.addPrimaryItem(item: kebab)
        bill.addPrimaryItem(item: chicken)
        bill.addPrimaryItem(item: wine)
        
        dante.addItem(item: kebab)
        sally.addItem(item: chicken)
        dante.addItem(item: wine)
        
        
        let billManager = BillManager(bill: bill, people: [dante, sally])
        billManager.calculateCharges()
    }
    
}

