//
//  CardViewModel.swift
//  PizzaShop
//
//  Created by geka231 on 04.01.2023.
//

import Foundation

class CartViewModel : ObservableObject {
    
    @Published var positions = [Position]( )
    
    func addPosition(_ position: Position){
        self.positions.append(position)
    }
    
}
