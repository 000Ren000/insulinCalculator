//
//  ContentView.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 30.07.2023.
//

import SwiftUI

struct CalculationHash: View {
    @State var carbohydrates: String = "73.8" // Угливоды
    @State var dryWeight: String = "" // Вес сухого продукта
    @State var finishedProductWeight: String = "" // Вес готового продукта
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TextField("Вес сухого продукта", text: $dryWeight)
                    .frame(maxWidth: screen.width * 0.65, minHeight: 40)
                    .foregroundColor(.green)
                    .bold()
                    .padding(.horizontal, 30)
                    .background(Color("textFieldColor"))
                    .cornerRadius(11)
                
                HStack{
                    Button {
                        dryWeight = "200"
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
                        dryWeight = "300"
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
                        dryWeight = "400"
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
                
                
                TextField("Вес готового продукта", text: $finishedProductWeight)
                    .frame(maxWidth: screen.width * 0.65, minHeight: 40)
                    .foregroundColor(.green)
                    .bold()
                    .padding(.horizontal, 30)
                    .background(Color("textFieldColor"))
                    .cornerRadius(11)
                
                
                VStack {
                    
                    HStack{
                        Button {
                            print("200")
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
                            print("300")
                        } label: {
                            Text("300")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color("buttonColor"))
                        .cornerRadius(15)
                    }
                    
                    HStack{
                        Button {
                            print("200")
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
                            print("300")
                        } label: {
                            Text("300")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .padding(5)
                        .padding(.horizontal, 10)
                        .background(Color("buttonColor"))
                        .cornerRadius(15)
                    }
                }
                
                
                Spacer()
            }
            .frame(maxWidth: screen.width * 0.70, maxHeight: 300)
            .padding(30)
            .background(Color("bg-front"))
            .cornerRadius(10)
                       
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color("bg"))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading: HStack {
            Image(systemName: "line.horizontal.3")
            Spacer(minLength: 25)
            Text("Расчяет каши")
                .font(.title2.bold())
            }
        ).foregroundColor(Color("textColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationHash()
    }
}
