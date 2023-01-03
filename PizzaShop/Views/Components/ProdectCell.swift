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
        VStack(spacing: 4){
            Image("margaritaPizza")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                    Spacer()
                Text("\(product.price) ₽")
                    .font(.custom("AvenirNext-bold", size: 12))
            }.padding(.horizontal, 6)
                .padding(.bottom, 6)
        }.frame(width: screen.width * 0.45, height: screen.width * 0.5)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 4)
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
