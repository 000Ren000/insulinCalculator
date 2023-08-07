//
//  MainTabBar.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 05.08.2023.
//

import SwiftUI


struct MainTabBar: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("textColor"))
    }
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                CalculationHash()
            }
            .foregroundColor(.green)
            .tabItem ({
                VStack {
                    Image(systemName: "menucard")
                    Text("Каши")
                }
                .foregroundColor(Color("buttonColor"))
            })
            NavigationView {
                CalculationProducts()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "syringe.fill")
                        Text("Готовый продукт")
                    }.foregroundColor(.white)
                }

            
        }

        .accentColor(Color("buttonColor"))
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
