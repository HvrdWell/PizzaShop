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
            CatalogView( )
                .tabItem{
                VStack{
                    Image(systemName: "menucard")
                    Text("Каталог")
                }
            }
            
            CardView()
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
