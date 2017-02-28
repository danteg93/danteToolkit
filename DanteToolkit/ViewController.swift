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
        
        
        let sally = Person(name: "Sally")
        let dante = Person(name: "Dante")
        let phong = Person(name: "Phong")
        let ashley = Person(name: "Ashley")
        let people2 = [sally, dante, phong, ashley]
        let pasta = Item(name: "Pasta", price: 18.95)
        let steak = Item(name: "Steak", price: 19.95)
        let marsala = Item(name: "Marsala", price: 18.95)
        let burger = Item(name: "Burger", price: 13.95)
        let cheeseCake = Item(name: "CheeseCake", price: 7.95).splitItem(parts: 2)
        let tiramisu = Item(name: "Tiramisu", price: 8.50).splitItem(parts: 2)
        
        sally.addItem(item: pasta)
        sally.addItem(item: cheeseCake![0])
        dante.addItem(item: burger)
        dante.addItem(item: cheeseCake![1])
        ashley.addItem(item: steak)
        ashley.addItem(item: tiramisu![0])
        phong.addItem(item: marsala)
        phong.addItem(item: tiramisu![1])
        
        for person in people2 {
            person.toString()
        }
        
    
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

