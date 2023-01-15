//
//  OrderViewModel.swift
//  PizzaShop
//
//  Created by geka231 on 12.01.2023.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: Order
    @Published var user = MUser(id: "", name: "", phone: 0, address: "")
    init(order: Order) {
        self.order = order
    }
    func getUserData() {
        DatabaseService.shared.getProfile(by: order.userID, completion: { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
}
