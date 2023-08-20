//
//  CalculationProducts.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 05.08.2023.
//

import SwiftUI
import Combine

struct CalculationProducts: View {
    @State var ins = "0"
    @State var showingAlert = false
    
    @State var weight = ""
    @State var carbohydrates = ""
    
    @FocusState var closeNumericPanel: Bool
    @ObservedObject var insCalc = InsulinCalc()
    
    func inputCheck () -> Bool {
        if  carbohydrates == "" ||
                weight == "" {
            return false
        } else {
            return true
        }
    }

    
    var body: some View {
        VStack() {
            HStack (spacing: 25) {
               Image(systemName: "line.horizontal.3")
               Text("Расчяет готового продукта")
                   .font(.title2.bold())
                Spacer()
           }
            Rectangle().frame(height: 1)
                .padding(.bottom, 25)
                .padding(.horizontal, 10)
            
            VStack(spacing: 20) {
                TextField("Вес на упаковке", text: $weight)
                    .focused($closeNumericPanel)
                    .keyboardType(.decimalPad)
                    .onReceive(Just(insCalc.finishedProductWeight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            insCalc.finishedProductWeight = filtered
                        }
                    }
                    .frame(maxWidth: screen.width * 0.65, minHeight: 40)
                    .foregroundColor(.green)
                    .bold()
                    .padding(.horizontal, 30)
                    .background(Color("textFieldColor"))
                    .cornerRadius(11)
                
                
                TextField("Угливоды с упаковки", text: $carbohydrates)
                    .focused($closeNumericPanel)
                    .keyboardType(.decimalPad)
                    .onReceive(Just(carbohydrates)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                           carbohydrates = filtered
                        }
                    }
                    .frame(maxWidth: screen.width * 0.65, minHeight: 40)
                    .foregroundColor(.green)
                    .bold()
                    .padding(.horizontal, 30)
                    .background(Color("textFieldColor"))
                    .cornerRadius(11)
                
                    
                

                    
                    Button {
                        if inputCheck() {
                            insCalc.carbohydrates = carbohydrates
                            ins = String(insCalc.getFinishProduct(weight: weight))
                        }
                        self.showingAlert.toggle()
                    } label: {
                        Text("Расчитать")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .padding(10)
                    .padding(.horizontal, 20)
                    .background(Color("buttonColor"))
                    .cornerRadius(20)
                    .padding(.vertical, 20)
                
                
            }
            .frame(maxWidth: screen.width * 0.70)
            .padding(30)
            .background(Color("bg-front"))
            .cornerRadius(10)
            
            
            Spacer()
            
            Text(ins)
                .font(.system(size: 60))
                .bold()
            
            Image("Union")
                .resizable()
                .frame(maxWidth: screen.width * 0.8, maxHeight: 80)
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color("bg"))
        .navigationBarTitle("", displayMode: .inline)
        .foregroundColor(Color("textColor"))
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button ("Готово"){
                    closeNumericPanel = false
                }.foregroundColor(.blue)
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Результат"), message: Text("\(ins) гр"), dismissButton: .default(Text("Готово")))
        }
    }
}

struct CalculationProducts_Previews: PreviewProvider {
    static var previews: some View {
        CalculationProducts()
    }
}
