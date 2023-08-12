//
//  ProductsCatalog.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 08.08.2023.
//

import Foundation

class ProductsCatalog: ObservableObject {
    
    static let shared = ProductsCatalog()
    
    var productList = [
        Product(id: UUID().uuidString,
                name: "Гречка",
                carbohydrates: "73.8",
                image: "Гречка"
               ),
        Product(id: UUID().uuidString,
                name: "Перловка",
                carbohydrates: "65.95",
                image: "Перловка"
               ),
        Product(id: UUID().uuidString,
                name: "Макароны",
                carbohydrates: "70.4",
                image: "Макароны"
               ),
        Product(id: UUID().uuidString,
                name: "Бурый рис",
                carbohydrates: "69.65",
                image: "Бурый рис"
               )
    ]
    
}

