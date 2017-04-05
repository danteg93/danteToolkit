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
        portos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func lmfao() {
        
        let subTotal = 74.85
        let tax = SubCharge(subAmount: 5.80, totalAmount: subTotal)
        let tip = SubCharge(subAmount: 12.00, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        
        let sally = Person(name: "Sally")
        let dante = Person(name: "Dante")
        let nate = Person(name: "Nathaniel")
        let people = [sally, dante, nate]
        
        let clamPasta = Item(name: "Clam Pasta", price: 16.95)
        let manicott = Item(name: "Manicott", price: 14.95)
        let 🍆 = Item(name: "🍆 Pasta", price: 14.95)
        let martini = Item(name: "Martini", price: 11.50)
        let wine = Item(name: "Wine", price: 16.50).splitItem(parts: 2)
        
        sally.addItem(item: clamPasta)
        sally.addItem(item: wine![0])
        dante.addItem(item: manicott)
        dante.addItem(item: wine![1])
        nate.addItem(item: 🍆)
        nate.addItem(item: martini)
        
        for person in people {
            person.toString()
            bill.addSubCharge(amount: person.calculateTotal(), name: person.getName())
        }
        bill.readBill()
    }
    private func lmfao2() {
        
        let subTotal = 21.40
        let tax = SubCharge(subAmount: 1.66, totalAmount: subTotal)
        let tip = SubCharge(subAmount: 3.94, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        
        let sally = Person(name: "Sally")
        let dante = Person(name: "Dante")
        let people = [sally, dante]
        
        let halfRamen = Item(name: "Ramen Small", price: 5.95)
        let flavoredEgg = Item(name: "Flavored Egg", price: 1.50)
        let takoyaki = Item(name: "Takoyaki", price: 5.00).splitItem(parts: 2)
        let fullRamen = Item(name: "Ramen", price: 8.95)
        
        sally.addItem(item: fullRamen)
        sally.addItem(item: takoyaki![0])
        dante.addItem(item: halfRamen)
        dante.addItem(item: takoyaki![1])
        dante.addItem(item: flavoredEgg)
        
        for person in people {
            person.toString()
            bill.addSubCharge(amount: person.calculateTotal(), name: person.getName())
        }
        bill.readBill()
    }
    
    private func theCottage() {
        
        let subTotal = 29.50
        let tax = SubCharge(subAmount: 2.36, totalAmount: subTotal)
        let tip = SubCharge(subAmount: 5.00, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        
        let sally = Person(name: "Sally")
        let dante = Person(name: "Dante")
        let people = [sally, dante]
        
        let hotTea = Item(name: "Hot Tea", price: 3.00)
        let eggs = Item(name: "Eggs La Jolla", price: 14.00)
        let chilaquiles = Item(name: "Chilaquiles", price: 12.00)
        let jalapenos = Item(name: "Jalapeños", price: 0.50)
        
        sally.addItem(item: hotTea)
        sally.addItem(item: eggs)
        dante.addItem(item: chilaquiles)
        dante.addItem(item: jalapenos)
        
        for person in people {
            person.toString()
            bill.addSubCharge(amount: person.calculateTotal(), name: person.getName())
        }
        bill.readBill()
    }
    
    private func phills() {
        let subTotal = 45.73
        let tax = SubCharge(subAmount: 2.30, totalAmount: subTotal)
        let tip = SubCharge(subAmount: 7.20, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        
        let sally = Person(name: "Sally")
        let dante = Person(name: "Dante")
        let people = [sally, dante]
        
        let hawaii = Item(name: "Hawaiian", price: 8.00)
        let ribChicken = Item(name: "Rib & Chicken Dinner", price: 13.79)
        let ribless = Item(name: "Ribless Dinner", price: 11.69)
        let onions = Item(name: "Onion Rings", price: 4.25).splitItem(parts: 2)
        
        sally.addItem(item: hawaii)
        sally.addItem(item: ribChicken)
        sally.addItem(item: onions![0])
        dante.addItem(item: hawaii)
        dante.addItem(item: ribless)
        dante.addItem(item: onions![1])
        
        for person in people {
            person.toString()
            bill.addSubCharge(amount: person.calculateTotal(), name: person.getName())
        }
        bill.readBill()
    }
    
    private func extraordinary() {
        let subTotal = 42.80
        let tax = SubCharge(subAmount: (1.28 + 3.42), totalAmount: subTotal)
        let tip = SubCharge(subAmount: 7.13, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        let dante = Person(name: "Dante")
        let hannah = Person(name: "Hannah")
        let cameron = Person(name: "Cameron")
        let people = [dante, cameron, hannah]
        
        let coffeePot = Item(name: "Coffee Pot", price: 6.95).splitItem(parts: 2)
        let americano = Item(name: "Americano", price: 3.50)
        let espresso = Item(name: "Espresso", price: 3.50)
        let wcc = Item(name: "White Cheese Cake", price: 8.95)
        let bp = Item(name: "Bread Pudding", price: 9.95)
        let car = Item(name: "Caramel Macademia", price: 9.95)
        
        hannah.addItem(item: coffeePot![1])
        hannah.addItem(item: car)
        cameron.addItem(item: coffeePot![0])
        cameron.addItem(item: bp)
        dante.addItem(item: americano)
        dante.addItem(item: espresso)
        dante.addItem(item: wcc)
        
        for person in people {
            person.toString()
            bill.addSubCharge(amount: person.calculateTotal(), name: person.getName())
        }
        bill.readBill()
    }
    
    private func maison() {
        let subTotal = 22.20
        let tax = SubCharge(subAmount: 1.72, totalAmount: subTotal)
        let tip = SubCharge(subAmount: 2.00, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        let dante = Person(name: "Dante")
        let sally = Person(name: "Sally")
        let people = [sally, dante]
        
        let spicyChicken = Item(name: "Spicy Chicken", price: 11.25)
        let kabob = Item(name: "Kabob", price: 10.95)
        
        dante.addItem(item: kabob)
        sally.addItem(item: spicyChicken)
        
        for person in people {
            person.toString()
            bill.addSubCharge(amount: person.calculateTotal(), name: person.getName())
        }
        
        bill.readBill()
    }
    
    private func portos() {
        let subTotal = 17.67
        let tax = SubCharge(subAmount: 1.37, totalAmount: subTotal)
        let tip = SubCharge(subAmount: 0.00, totalAmount: subTotal)
        let bill = Bill(subTotal: subTotal, tax: tax, tip: tip)
        
        let dante = Person(name: "Dante")
        let sally = Person(name: "Sally")
        let people = [sally, dante]
        
        let cubano = Item(name: "Cubano", price: 5.95)
        let turkey = Item(name: "Turkey", price: 5.10)
        let potatoBall = Item(name: "Potato", price: (1.96/2.0))
        let cheeseBall = Item(name: "Cheese", price: 1.29)
        let chicken = Item(name: "Chicken", price: 0.99)
        let ham = Item(name: "Ham", price: 0.89)
        let guava = Item(name: "Guava", price: 0.89)
        let dulceDeLeche = Item(name: "Dulce de Lecge", price: 0.60)
        
        dante.addItem(item: turkey)
        dante.addItem(item: potatoBall)
        dante.addItem(item: cheeseBall)
        dante.addItem(item: dulceDeLeche)
        sally.addItem(item: cubano)
        sally.addItem(item: potatoBall)
        sally.addItem(item: chicken)
        sally.addItem(item: ham)
        sally.addItem(item: guava)
        
        for person in people {
            person.toString()
            bill.addSubCharge(amount: person.calculateTotal(), name: person.getName())
        }
        
        bill.readBill()
    }
}

