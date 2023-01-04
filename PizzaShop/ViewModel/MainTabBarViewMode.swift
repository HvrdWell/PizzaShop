//
//  MainTabBarViewMode.swift
//  PizzaShop
//
//  Created by geka231 on 04.01.2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
