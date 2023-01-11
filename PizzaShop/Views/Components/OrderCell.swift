//
//  OrderCell.swift
//  PizzaShop
//
//  Created by geka231 on 09.01.2023.
//

import SwiftUI
import Firebase

    struct OrderCell: View {
        var order: Order
        
        var body: some View {
            HStack {
                Text("\(order.date)")
                Text("\(order.cost)")
                    .bold()
                    .frame(width:100)
                Text("\(order.status)")
                    .frame(width: 100)
                    .foregroundColor(.green)
            }
        }
    }

    struct OrderCell_Previews: PreviewProvider {
        static var previews: some View {
            let order = Order(userID: "Айди",
                               date: Date(),
                               status: "Новый")
            OrderCell(order: order)
        }
    }
