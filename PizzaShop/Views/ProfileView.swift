//
//  ProfileView.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel : ProfileViewModel
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing:30) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .background(Color("lightGray"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }.confirmationDialog("Откуда взять фото", isPresented: $isAvaAlertPresented){ Button(action: {
                        print("libr")
                    }, label: {
                        Text("Из галереи")
                    })
                        
                        Button(action: {
                            print("Camera")
                        }, label: {
                            Text("С камеры")
                        })
                        
                        
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.body.bold())
                    HStack{
                        Text("+7")
                        TextField("Телефон", value: $viewModel.profile.phone, format: .number)
                    }
                }
            }.padding(.horizontal)
            VStack(alignment: .leading, spacing: 8) {
                Text("Адрес доставки")
                    .bold()
                
                TextField("Ваш адрес", text: $viewModel.profile.address)
            }.padding(.horizontal)
            
            //табл с заказами
            List {
                if viewModel.orders.count == 0 {
                    Text("Ваши заказы будут тут")
                } else{
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
            }.listStyle(.plain)
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Выйти")
                    .padding()
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(20)
                
            }.padding( )
                .confirmationDialog("Точно ли выйти?", isPresented: $isQuitAlertPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }
                    
                }
            
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
            
        }
        .onSubmit {
            viewModel.setProfile()
        }
        .onAppear{
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: MUser(id: "", name: "fd", phone: 443, address: "fdv")))
    }
}
