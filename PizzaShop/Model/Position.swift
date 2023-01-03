//
//  Position.swift
//  PizzaShop
//
//  Created by geka231 on 04.01.2023.
//

import Foundation

struct Position {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int{
        return product.price * self.count
    }
}
