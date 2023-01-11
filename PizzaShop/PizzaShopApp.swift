//
//  PizzaShopApp.swift
//  PizzaShop
//
//  Created by geka231 on 02.01.2023.
//

import SwiftUI
import Firebase
let screen = UIScreen.main.bounds

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("ОК firebase")
        
        return true
    }
}
@main
struct PizzaShopApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if let user = AuthService.shared.currentUser{
                if user.uid == "5ntRBPmK8zRQA0VAX8MSV4wG0Kl2"{
                    AdminOrdersView( )
                }else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBar(viewModel: viewModel )
                }
            }else{
                AuthView()
            }
        }
    }
}
