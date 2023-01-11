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
                Text("Cost-\(order.cost)").bold().frame(width:90)
                Text("\(order.status)").frame(width: 100).foregroundColor(.green)
            }
        }
    }

    struct OrderCell_Previews: PreviewProvider {
        static var previews: some View {
            let ord = Order(userID: "userID",
                               date: Date(),
                               status: "New order")
            OrderCell(order: ord)
        }
    }
