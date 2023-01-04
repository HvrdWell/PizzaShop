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
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Мирослава Филиппецкий")
                        .bold()
                    Text("+ 7 9152222222")
                }
            }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Адрес доставки")
                        .bold()
                    
                    Text("Россия, Московскаая область, г. Нижний Уренгой, ул, Юсасп, дом. 3, кв. 44")
                }
            
                //табл с заказами
                List {
                    Text("Ваши заказы будут тут")
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
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
