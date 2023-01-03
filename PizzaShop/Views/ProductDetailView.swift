//
//  ProductDetailView.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size = "Средняя"
    @State var count = 1
    
    @Environment(\.presentationMode) var presetationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Image("margaritaPizza")
                    .resizable()
                    .frame(maxWidth: .infinity,  maxHeight: 200)
                HStack {
                    Text("\(viewModel.product.title)!")
                        .font(.title2).bold()
                    Spacer( )
                    Text("\(viewModel.gerPrice(size: size)) ₽")
                        .font(.title2)
                    
                }.padding(.horizontal)
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                
                HStack {
                    Stepper("Количество", value: $count , in: 1...10)
                    Text("\(self.count)")
                        .padding(.leading, 32)
                }.padding(.horizontal)
                    .padding(.vertical, 4)
                
                Picker("Размер пиццы", selection: $size) {
                    
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
            }
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        size: self.size,
                                        count: self.count)
                
                position.product.price = viewModel.gerPrice(size: self.size)
                
                CartViewModel.shared.addPosition(position)
                presetationMode.wrappedValue.dismiss()
            } label: {
                Text("Добавить в корзину")
                    .padding()
                    .padding(.horizontal,9)
                    .foregroundColor(.black)
                    .font(.title3.bold())
                    .background(LinearGradient(colors: [Color ("yellow"),Color ("orange")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(15)
                
            }
            Spacer( )
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(
            id: "1",
            title:"Маргарита" ,
            imageUrl: "not found",
            price: 450,
            descript: "Дешевая") ))
    }
}
