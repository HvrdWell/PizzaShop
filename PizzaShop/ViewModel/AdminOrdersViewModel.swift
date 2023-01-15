//
//  AdminOrdersViewModel.swift
//  PizzaShop
//
//  Created by geka231 on 12.01.2023.
//

import Foundation

class AdminOrdersViewModel : ObservableObject {
    
    @Published var orders = [Order]( )
    var currentOrder = Order(userID: "", date: Date(), status: "")
    func getOrders( ) {
        DatabaseService.shared.gerOrders(by: nil) { result in
            switch result{
            case .success(let orders):
                self.orders = orders
                for(index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result{
                        case .success(let positions):
                            self.orders[index].positions = positions
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
