//
//  Popup.swift
//  Insulin Calculator
//
//  Created by Антон Фондов on 17.08.2023.
//

import SwiftUI

struct Popup: View {
    
    @State var message = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State var showPopup: Bool
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .bold()
                }
                .foregroundColor(Color("buttonColor"))
                .offset(x: 35)
            }
            ZStack(alignment: .center) {
                
                VStack {
                    Text(message)
                        .font(.system(size: 24))
                        .padding()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Закрыть")
                            .padding(12)
                            .padding(.horizontal)
                            .background(Color("buttonBlack"))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }

                }
            }
            .frame(minWidth: screen.width * 0.75,
                   maxWidth: screen.width * 0.75,
                   minHeight: screen.height * 0.2)
            .background(.white)
            .cornerRadius(15)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color("popupBackgrounf"), ignoresSafeAreaEdges: .all)
        
    }
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup(message: "Текст сообщения", showPopup: true)
    }
}
