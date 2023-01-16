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
    @State private  var isShowAlert = false
    @State private var alertMessage = ""
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
                        AuthService.shared.signIn(email: self.email, password: self.password) { result in
                            switch result{
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка входа\(error.localizedDescription)"
                                self.password = ""
                                self.isShowAlert.toggle()
                            }
                        }
                    } else{
                        guard password == confirmPassowrd else {
                            self.alertMessage = "Пароли не совпадают!"
                            self.isShowAlert.toggle()
                            return
                        }
                        AuthService.shared.signUp(email: self.email, password: self.password){ result in
                            switch result{
                            case .success(let user):
                                alertMessage = "Вы зарегистрировались с email \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassowrd = ""
                                isAuth.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка регистрации \(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                        
                        
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
                       //.bold()
                        .foregroundColor(Color.yellow)
                        .alert(alertMessage, isPresented: $isShowAlert) {
                            Button {
                            } label: {
                                Text("Ok")
                            }
                        }
                    
                }
                
            }
            .padding(25)
            .background(Color.gray)
            .cornerRadius(30)
            .padding(isAuth ? 20 : 10)
            
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("pizzaBackground")
                .blur(radius: isAuth ? 0 : 12)
            )
            .animation(Animation.easeInOut(duration: 0.3), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                
                if AuthService.shared.currentUser?.uid == "5ntRBPmK8zRQA0VAX8MSV4wG0Kl2"{
                    AdminOrdersView( )
                }else{
                    let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                    MainTabBar(viewModel: mainTabBarViewModel)
                }
                
                
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
