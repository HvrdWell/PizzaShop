//
//  MainTabBar.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView{
            NavigationView {
                CatalogView( )
            }
                .tabItem{
                VStack{
                    Image(systemName: "menucard")
                    Text("Каталог")
                }
            }
            
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                VStack{
                    Image(systemName: "cart")
                    Text("Корзина")
                }
                
            }
            
            ProfileView()
                .tabItem{
                VStack{
                    Image(systemName: "person")
                    Text("Профиль")
                }
            }
            

        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
