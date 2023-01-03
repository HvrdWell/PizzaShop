//
//  ContentView.swift
//  PizzaShop
//
//  Created by geka231 on 02.01.2023.
//

import SwiftUI

struct AuthView: View {
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassowrd = ""
    
    @State private var isTabViewShow = false
    
    var body: some View {
        VStack {
            Text(isAuth ? "Авторизация" : "Регистрация")
                .padding()
                .padding(.horizontal, 20)
                .background(Color.gray)
                .cornerRadius(30)
                .font(.title2)
                .bold()
                .padding()
            VStack{
                TextField("Введите e-mail", text: $email)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .padding(8)
                    
                    
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .padding(8)
                
                if !isAuth {
                    SecureField("Подтвердите пароль", text: $confirmPassowrd)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .padding(8)
                }

                Button {
                    if isAuth {
                        print("Авторизация")
                        isTabViewShow.toggle()
                    } else{
                        self.email = ""
                        self.password = ""
                        self.confirmPassowrd = ""
                        self.isAuth.toggle()

                    }
                    
                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт")
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(LinearGradient(colors: [Color ("yellow"),Color ("orange")], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .padding(9)

                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Еще не с нами?" : "Уже с нами?")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 8)
                        .padding(.horizontal, 12)
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color.yellow)
                    
                    
                }

            }
            .padding(25)
            .background(Color.gray)
                .cornerRadius(30)
                .padding(isAuth ? 20 : 10)
                
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("pizzaBackground").blur(radius: isAuth ? 0 : 12))
        .animation(Animation.easeInOut(duration: 0.3), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            MainTabBar( )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
