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
        lmfao()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func lmfao() {
        let subTotal = 88.25
        let tax = SubCharge(subAmount: 6.84, totalAmount: subTotal)
        let tip = SubCharge(subAmount: 14.26, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        let person1 = 18.95 + (7.95 / 2.0)
        let person2 = 19.95 + (8.5 / 2.0)
        let person3 = 18.95 + (8.5 / 2.0)
        let person4 = 13.95 + (7.95 / 2.0)
        let people = [person1 , person2, person3, person4]
        
        for person in people {
            bill.addSubCharge(amount: person)
        }
        bill.readBill()
    }
    

}

