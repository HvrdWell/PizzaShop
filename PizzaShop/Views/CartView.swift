//
//  CardView.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel
    @State private var showAlert = false
    @State private var showMakeOrderAlert = false
    var body: some View {
        VStack {
            List(viewModel.positions){ position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll{ pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }.tint(.red)
                        
                    }
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
                    showAlert.toggle()
                    
                }label: {
                    Text("Отменить")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(15)
                }.confirmationDialog(
                    "Очистить корзину?",
                    isPresented: $showAlert,
                    titleVisibility: .visible
                ) {
                    Button("Да", role: .destructive) {
                        withAnimation {
                            CartViewModel.shared.clearPositions()
                        }
                    }.keyboardShortcut(.defaultAction)

                    Button("Нет", role: .cancel) {}
                }
                Button {
                    print("add")
                    var order = Order(userID: AuthService.shared.currentUser!.uid,
                                      date: Date(),
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOrder(order: order){ result in
                        switch result{
                        case .success (let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    CartViewModel.shared.clearPositions()
                    showMakeOrderAlert.toggle()
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
            }.alert("Ваш заказ оформлен", isPresented: $showMakeOrderAlert) {
                Button {
                } label: {
                    Text("Хорошо")
                }
            }
            
        }.padding()
        
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
