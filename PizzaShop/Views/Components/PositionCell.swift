//
//  PositionCell.swift
//  PizzaShop
//
//  Created by geka231 on 04.01.2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            VStack(alignment: .leading , spacing: 2) {
                Text(position.product.title)
                    .fontWeight(.bold)
                Text(position.size)
                    .font(.caption2)
            }
            Spacer( )
            Text("\(position.count) шт.")
            Text("\(position.cost) ₽")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Маргарита Гурме",imageUrl: "margarita", price: 350, descript: "fdds"), size: "Маленькая",count: 3)
                     
        )
    }
}
