//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item: SKU {
    let name: String
    let priceEach: Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    private var items: [SKU] = []
    
    func add(_ item: SKU) {
        items.append(item)
    }
    
    func getItems() -> [SKU] {
        return items
    }
    
    func total() -> Int {
        return items.reduce(0) { $0 + $1.price() }
    }
    
    func output() -> String {
        var output = "Receipt:\n"
        for item in items {
            let priceInDollars = Double(item.price()) / 100.0
            output += "\(item.name): $\(String(format: "%.2f", priceInDollars))\n"
        }
        output += "------------------\n"
        let totalInDollars = Double(total()) / 100.0
        output += "TOTAL: $\(String(format: "%.2f", totalInDollars))"
        return output
    }
}

class Register {
    private var currentReceipt: Receipt
    
    init() {
        self.currentReceipt = Receipt()
    }
    
    func scan(_ item: SKU) {
        currentReceipt.add(item)
    }
    
    func subtotal() -> Int {
        return currentReceipt.total()
    }
    
    func total() -> Receipt {
        let receipt = currentReceipt
        currentReceipt = Receipt()
        return receipt
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

