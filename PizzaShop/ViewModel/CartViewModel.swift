//
//  CardViewModel.swift
//  PizzaShop
//
//  Created by geka231 on 04.01.2023.
//

import Foundation

class CartViewModel : ObservableObject {
    
    @Published var positions = [Position]( )
    var costTotal: Int{
        var sum = 0
        for pos in positions{
            sum += pos.cost
        }
        return sum
    }
    func addPosition(_ position: Position){
        self.positions.append(position)
    }
    
}
