//
//  ProductViewModel.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 08.08.2023.
//

import SwiftUI

struct ProductViewModel: View {
    
    let product: Product
    
    var body: some View {
       
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 43, height: 43)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding(5)
            Text(product.name)
                .padding(.horizontal, 15)
            Spacer()
            VStack{
                Text("Углеводов:")
                Text(product.carbohydrates)
            }
        }
        
    }
}

struct ProductViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ProductViewModel(product: Product(
            id: UUID().uuidString,
            name: "Бурый рис",
            carbohydrates: "37.7",
            image: "Макароны"
        ))
    }
}


