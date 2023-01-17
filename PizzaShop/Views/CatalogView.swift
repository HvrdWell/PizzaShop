//
//  catalogView.swift
//  PizzaShop
//
//  Created by geka231 on 03.01.2023.
//

import SwiftUI

struct CatalogView: View {
    let layoutForPopular = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPizza = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    @StateObject var viewModel =  CatalogViewModel( )
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            Section("Рекомендуемые"){
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: layoutForPopular, spacing: 15) {
                        ForEach(CatalogViewModel.shared.popularProducts,  id: \.id){item in
                            
                            NavigationLink {
                        let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProdectCell(product: item)
                                    .foregroundColor(.black)
                            }

                            
                            
                        }
                    }.padding()
                }
            }
            
            
            Section("Пицца"){
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: layoutForPizza) {
                        ForEach(viewModel.pizza,  id: \.id){item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProdectCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
            }
        }.navigationBarHidden(false)
            .navigationTitle("Меню")
            .onAppear {
                self.viewModel.getProducts()
            }
    }
}

struct catalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
