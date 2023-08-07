//
//  CalculationProducts.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 05.08.2023.
//

import SwiftUI

struct CalculationProducts: View {
    var body: some View {
        VStack {
         Text("Расчяет продукта с упаковки")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .foregroundColor(Color("textColor"))
            .background(Color("bg"))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: HStack{
                Text("Расчяет продукта с упаковки")
                    .font(.title2.bold())
                }
            ).foregroundColor(Color("textColor"))
    }
}

struct CalculationProducts_Previews: PreviewProvider {
    static var previews: some View {
        CalculationProducts()
    }
}
