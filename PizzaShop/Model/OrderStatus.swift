//
//  OrderStatus.swift
//  PizzaShop
//
//  Created by geka231 on 09.01.2023.
//

import Foundation

enum OrderStatus: String {
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case complete = "Выполнен"
    case cancel = "Отменен"
}
