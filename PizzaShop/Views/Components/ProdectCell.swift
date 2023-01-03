//
//  ProdectCell.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct ProdectCell: View {
    var product: Product
    var body: some View {
        VStack{
            Image("margaritaPizza")
                .resizable()
            HStack{
                Text(product.title)
                Text("\(product.price) ₽")
            }
        }.frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
    }
}

struct ProdectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProdectCell(product: Product(
                                     id: "1",
                                     title:"Маргарита" ,
                                     imageUrl: "not found",
                                     price: 450,
                                     descript: "Дешевая"))
    }
}
