//
//  ProductDetailView.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    
    var product: Product
    
    var body: some View {
        Text("\(product.title)")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(
            id: "1",
            title:"Маргарита" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая"))
    }
}
