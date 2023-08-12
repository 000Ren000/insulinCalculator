//
//  InsulinCalc.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 10.08.2023.
//

import Foundation


class InsulinCalc: ObservableObject {
    
    @Published var carbohydrates = "73.8"
    @Published var dryWeight = "400"
    @Published var finishedProductWeight = ""
    @Published var productName = "Гречка"
    @Published var productImage = "Гречка"
    
    func getXe () -> Double {
        let xe = Double(carbohydrates)!  / 100 * Double(dryWeight)! / 12
        return xe
    }
    
    func getCostIns (edIns: Double) -> Int {
        return Int(Double(finishedProductWeight)! / getXe() * Double(edIns) / 1.5)
    }
}

