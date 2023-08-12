//
//  ProductModel.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 08.08.2023.
//

import Foundation

class ProductModel: ObservableObject {
    
    static let shared = ProductModel()
    
    private init() { }
    
    @Published var productList = [Product]()
    
    func addProduct(_ product: Product) {
        self.productList.append(product)
    }
    
}
