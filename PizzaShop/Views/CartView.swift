//
//  CardView.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct CartView: View {
    var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            List(viewModel.positions){ position in
                PositionCell(position: position)
            }.listStyle(.plain)
                .navigationTitle("Корзина")
            HStack{
                Text("Итого:")
                    .fontWeight(.bold)
                Spacer( )
                Text("\(self.viewModel.costTotal) ₽")
                    .fontWeight(.bold)
            }.padding()
            
            HStack(spacing: 24){
                Button {
                    print("cancel")
                } label: {
                    Text("Отменить")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(15)
                }
                Button {
                    print("add")
                } label: {
                    Text("Заказать")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(15)
                }
            }
            
        }.padding()
      
            
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel( ))
    }
}
