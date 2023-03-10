//
//  AddProductView.swift
//  PizzaShop
//
//  Created by geka231 on 16.01.2023.
//

import SwiftUI

struct AddProductView: View {
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "margarita" )!
    @State private var title: String = ""
    @State private var descript: String = ""
    @State private var price: Int? = nil
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Добавить товар")
                .font(.title2)
                .bold()
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 250)
                .clipped()
                .cornerRadius(5)
                .onTapGesture {
                    showImagePicker.toggle()
                }
            
            TextField("Название продукта", text: $title)
                .padding()
            TextField("Цена продукта", value: $price, format: .number)
                .keyboardType(.numberPad)
                .padding()
            TextField("Описание продукта", text: $descript)
                .padding()
            Button {
                guard let price = price else {
                    print("Невозможно извлечь цену")
                    return
                }
                let product = Product(id: UUID( ).uuidString, title: title, price: price, descript: descript)
                guard let imageData = image.jpegData(compressionQuality: 0.3) else {
                    print("Картинка не грузится")
                    return
                }
                DatabaseService.shared.setProduct(product: product, image: imageData) { result in
                    switch result {
                        
                    case .success(let product):
                        print(product.title)
                            dismiss( )
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Cохранить")
                    .padding()
                    .padding(.horizontal,30)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }

            Spacer()
            
        }
        .padding()
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
