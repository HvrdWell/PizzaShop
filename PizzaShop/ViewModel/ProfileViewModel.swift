//
//  ProfileViewModel.swift
//  PizzaShop
//
//  Created by geka231 on 09.01.2023.
//

import Foundation
class ProfileViewModel: ObservableObject{

    
    @Published var profile: MUser
    @Published var orders: [Order] = [Order]( )
    init(profile: MUser){
        self.profile = profile
    }
    func getOrders( ) {
        DatabaseService.shared.gerOrders(by: AuthService.shared.currentUser!.accessibilityHint) { result  in
            switch result {
                
            case .success(let orders):
                self.orders = orders
                print("Всего заказов: \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func setProfile( ) {
        DatabaseService.shared.setProfile(user: self.profile){ Result in
            switch Result {
            case.success(let user):
                print(user.name)
            case.failure(let error):
                print("Ошибка отправки данных \(error.localizedDescription)")
            }
        }
    }
    func getProfile( ) {
        DatabaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
}

