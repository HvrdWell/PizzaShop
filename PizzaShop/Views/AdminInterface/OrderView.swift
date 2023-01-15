//
//  OrderView.swift
//  PizzaShop
//
//  Created by geka231 on 12.01.2023.
//

import SwiftUI

struct OrderView: View{

@StateObject var viewModel: OrderViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Саша Шляпик")
                .font(.title3).bold()
            Text("+7 432423423").bold()
            Text("Москва улица 32")

            List{
                ForEach(viewModel.order.positions, id: \.id){ position in
                    PositionCell(position: position)
                }
            }
        }.padding()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "Новый")))
    }
}
