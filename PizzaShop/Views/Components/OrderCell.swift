//
//  OrderCell.swift
//  PizzaShop
//
//  Created by geka231 on 09.01.2023.
//

import SwiftUI
import Firebase

struct OrderCell: View {
    
    @State  var order: Order = Order(userID: "", date: Date(), status: "Новый")
    var body: some View {
        HStack{
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
            Text("\(order.status)")
                .frame(width: 140)

        }
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell()
    }
}
