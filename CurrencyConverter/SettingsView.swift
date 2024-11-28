//
//  SettingsView.swift
//  CurrencyConverter
//
//  Created by Sabith Salman on 2024-11-28.
//

import SwiftUI

enum Currencies: String, CaseIterable{
    case usd = "USD"
    case gbp = "GBP"
    case aud = "AUD"
    case cad = "CAD"
    case eur = "EUR"
}

struct SettingsView: View {
    @Binding var defaultFoerignCurrency: Currencies
    @Binding var selectedCurrency : Currencies
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Currency")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding(.top)
                    .font(.system(size: 25))
                Picker("Select Currency", selection: $selectedCurrency ){
                    ForEach(Currencies.allCases,id: \.self){
                        currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.wheel)
                
                Spacer()
                
                
                
                
            
                
            }
            .padding()
            
            Button("Reset Settings"){
                selectedCurrency = .usd
                
                
            }
            .buttonStyle(.bordered)
            .tint(.red)

            .navigationTitle("Settings")
            
       
           
                
                  
         
        
        }
    }
}

#Preview {
    SettingsView(defaultFoerignCurrency: .constant(.usd),selectedCurrency: .constant(.usd))
}
