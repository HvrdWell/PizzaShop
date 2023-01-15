//
//  Position.swift
//  PizzaShop
//
//  Created by geka231 on 04.01.2023.
//

import Foundation
import FirebaseFirestore

struct Position: Identifiable {
    var id: String
    let product: Product
    let count: Int
    let price: Int
    var size: String
    var cost: Int{
        return price * self.count 
    }
    
    var representation: [String: Any] {
      
        var repres = [String: Any] ( )
        repres["id"] = id
        repres["count"] = count
        repres["title"] = product.title
        repres["price"] = self.price
        repres["total"] = self.cost
        repres["size"] = self.size
        return repres
    }
    internal init(id: String, product: Product, count: Int, price: Int, size: String) {
        self.id = id
        self.product = product
        self.count = count
        self.price = price
        self.size = size

    }
    
    init?(doc:  QueryDocumentSnapshot) {
        let data = doc.data( )
        
        guard let id = data["id"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        guard let count = data ["count"] as? Int else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let size = data["size"] as? String else {return nil}
        let product: Product = Product(id: "", title: title, imageUrl: "", price: price, descript: "")
        
        
        self.id = id
        self.product = product
        self.count = count
        self.price = price
        self.size = size
    }
}
