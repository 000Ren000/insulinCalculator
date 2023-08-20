//
//  ContentView.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 30.07.2023.
//

import SwiftUI
import Combine

struct CalculationHash: View {

    @State var showProductList: Bool = false
    @State var ins = "0"
    @State var showingAlert = false
    @State var showPopup = false
    
    @FocusState var closeNumericPanel: Bool
    
    @ObservedObject var insCalc = InsulinCalc()
    
    func inputCheck () -> Bool {
      if  insCalc.carbohydrates == "" ||
        insCalc.dryWeight == "" ||
            insCalc.finishedProductWeight == "" {
          return false
      } else {
          return true
      }
    }

    
    var body: some View {
        VStack {
            HStack (spacing: 25){
               Image(systemName: "line.horizontal.3")
               Text("Расчяет каши")
                   .font(.title2.bold())
                Spacer()
           }
            Rectangle().frame(height: 1)
                .padding(.bottom, 15)
                .padding(.horizontal, 10)
            
            
            
            HStack {
                Image(insCalc.productImage)
                    .resizable()
                    .frame(width: 65, height: 65)
                //.clipShape(Circle())
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                Text(insCalc.productName)
                    .font(.system(size: 40))
                    .bold()
                Spacer()
            }
            
            VStack(spacing: 20) {
                TextField("Вес сухого продукта", text: $insCalc.dryWeight)
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
                    .padding(.top, 40)
                
                
                HStack{
                    Button {
                        insCalc.dryWeight = "200"
                    } label: {
                        Text("200")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(Color("buttonColor"))
                    .cornerRadius(15)
                    
                    Button {
                        insCalc.dryWeight = "300"
                    } label: {
                        Text("300")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(Color("buttonColor"))
                    .cornerRadius(15)
                    
                    Button {
                        insCalc.dryWeight = "400"
                    } label: {
                        Text("400")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(Color("buttonColor"))
                    .cornerRadius(15)
                    
                }
                
                
                TextField("Вес готового продукта", text: $insCalc.finishedProductWeight)
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
                
                HStack {
                    
                    TextField("Кол углеводов", text: $insCalc.carbohydrates)
                        .focused($closeNumericPanel)
                        .keyboardType(.decimalPad)
                        .onReceive(Just(insCalc.carbohydrates)) { newValue in
                            let filtered = newValue.filter { ".0123456789".contains($0) }
                            if filtered != newValue {
                                insCalc.carbohydrates = filtered
                            }
                        }
                        .frame(maxWidth: screen.width * 0.65, minHeight: 40)
                        .foregroundColor(.green)
                        .bold()
                        .padding(.horizontal, 30)
                        .background(Color("textFieldColor"))
                        .cornerRadius(11)
                    Button {
                        self.showProductList.toggle()
                    } label: {
                        Text("Выбрать").foregroundColor(Color("textFieldColor"))
                    }.sheet(isPresented: $showProductList) {
                        ProductListView( insCalc: insCalc)
                    }
                    
                }
                
                VStack {
                    
                    HStack{
                        Button {
                            if inputCheck() {
                                ins = String(insCalc.getCostIns(edIns: 1))
                            }
                            self.showingAlert.toggle()
                        } label: {
                            Text("2 ед")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color("buttonColor"))
                        .cornerRadius(15)
                        //                        .alert("Нужно \(ins) гр", isPresented: $showingAlert) {
                        //                            Button("OK", role: .cancel) { }
                        //                        }
                        
                        
                        
                        Button {
                            if inputCheck() {
                                ins = String(insCalc.getCostIns(edIns: 2))
                            }
                            self.showingAlert.toggle()
                        } label: {
                            Text("3 ед")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color("buttonColor"))
                        .cornerRadius(15)
                        //                        .alert("Нужно \(ins) гр", isPresented: $showingAlert) {
                        //                            Button("Oк", role: .cancel) { }
                        //                        }
                    }
                    
                    HStack{
                        Button {
                            if inputCheck() {
                                ins = String(insCalc.getCostIns(edIns: 3))
                            }
                            self.showingAlert.toggle()
                        } label: {
                            Text("4ед")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color("buttonColor"))
                        .cornerRadius(15)
                        //                        .alert("Нужно \(ins) гр", isPresented: $showingAlert) {
                        //                            Button("OK", role: .cancel) { }
                        //                        }
                        Button {
                            if inputCheck() {
                                ins = String(insCalc.getCostIns(edIns: 4))
                            }
                            self.showingAlert.toggle()
                        } label: {
                            Text("5 ед")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color("buttonColor"))
                        .cornerRadius(15)
                        //                        .alert("Нужно \(ins) гр", isPresented: $showingAlert) {
                        //                            Button("OK", role: .cancel) { }
                        //                        }
                    }.padding(.bottom, 40)
                }
                
            }
            .frame(maxWidth: screen.width * 0.70, maxHeight: 300)
            .padding(30)
            .background(Color("bg-front"))
            .cornerRadius(10)
            
            
            Spacer()
            
            Text(ins)
                .font(.system(size: 60))
                .bold()
            
            
            
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





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationHash()
    }
}
