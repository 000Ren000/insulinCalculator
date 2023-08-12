//
//  ProductListView.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 08.08.2023.
//

import SwiftUI

struct ProductListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var insCalc = InsulinCalc()
    
    let productList = ProductsCatalog().productList
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Назад")
            }
            .padding(15)
            .padding(.top, 10)

            Spacer()
            
            List(productList) { product in
                Button {
                    insCalc.carbohydrates = product.carbohydrates
                    insCalc.productName = product.name
                    insCalc.productImage = product.image
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ProductViewModel(product: product)
                }.listRowBackground(Color("bg-front"))
                    
               
                      
            }
            .scrollContentBackground(.hidden)
            
        }
        .background(Color("bg"))
        .foregroundColor(Color("textColorWhite"))
       
        
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
