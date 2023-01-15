//
//  AddProductView.swift
//  PizzaShop
//
//  Created by geka231 on 16.01.2023.
//

import SwiftUI

struct AddProductView: View {
    @State private var showImagePicker = false
    @State private var image = UIImage( )
    var body: some View {
        VStack{
            Image("margarita")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(5)
                .onTapGesture {
                    showImagePicker.toggle()
                }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
