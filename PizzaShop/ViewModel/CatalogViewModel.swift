//
//  CatalogViewModel.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import Foundation

class CatalogViewModel: ObservableObject{
    
    static let shared = CatalogViewModel( )
    
    var popularProducts = [
        Product(
            id: "1",
            title:"Маргарита" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
        Product(
            id: "2",
            title:"Маргарита вторая" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
        Product(
            id: "3",
            title:"Маргарита третья" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
        Product(
            id: "4",
            title:"Маргарита четвертая" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
    ]
    var pizza = [
        Product(
            id: "1",
            title:"Маргарита" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
        Product(
            id: "2",
            title:"Маргарита вторая" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
        Product(
            id: "3",
            title:"Маргарита третья" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
        Product(
            id: "4",
            title:"Маргарита четвертая" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
    ]
}
