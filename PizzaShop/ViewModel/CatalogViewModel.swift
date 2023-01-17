//
//  CatalogViewModel.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import Foundation

class CatalogViewModel: ObservableObject{
    
    static let shared = CatalogViewModel( )
 
   @Published var popularProducts = [
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
    @Published var pizza = [
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
        Product(
            id: "5",
            title:"Маргарита четвертая" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"),
    ]
    
    func getProducts( ){
        DatabaseService.shared.getProducts { result in
            switch result{
                
            case .success(let products):
                self.pizza = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
