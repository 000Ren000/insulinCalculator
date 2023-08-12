//
//  ProductListView.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 08.08.2023.
//

import SwiftUI

struct ProductListView: View {
    var body: some View {
        TabView {
            HStack {
                Text("Строка1")
            }
            HStack {
                Text("Строка2")
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
