//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Sabith Salman on 2024-11-28.
//

import SwiftUI

struct ContentView: View {
    @State var firstNumberInput: Int? = nil
    @Binding var selectedCurrency : Currencies
    @Binding var defaultFoerignCurrency: Currencies
    @State var toggleSelection: Bool = false
    // Dictionary to get the rate agains the LKR for a given currency
    let rates = [
        "USD": 308.81,
        "GBP": 390.31,
        "AUD": 204.40,
        "CAD": 232.82,
        "EUR": 334.92
        // Add other rates here
    ]
    
    @State private var text = "" // SAMPLE
    @State private var secondNumberInput: Int? = nil
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("Other Currency", value: $firstNumberInput, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .border(Color.black, width: 1)
                        .onChange(of: firstNumberInput){
                            newValue in
                            if(toggleSelection == false){
                                if let firstNumConvert = firstNumberInput{
                                    convert(newValue: firstNumConvert)
                                }
                                
                                
                                
                            }else{
                                print("No need to change first textfield")
                            }
                        }
                    Picker("Selected Currency",selection: $selectedCurrency){
                        ForEach(Currencies.allCases,id: \.self){
                            list in Text(list.rawValue).tag(list)
                        }
                        
                        
                    }
                    .pickerStyle(.menu)
                }
                HStack{
                    
                    TextField("LKR Currency", value: $secondNumberInput, format: .number)
                        .border(.black,width: 1)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: secondNumberInput){
                            newVal in
                            if(toggleSelection == true){
                                if let secondNumberInputConvert = secondNumberInput{
                                    reverseConvert(newValue: secondNumberInputConvert)
                                }
                            }
                        }
                    
                    Text("LKR")
                        .bold()
                }
                Toggle(isOn: $toggleSelection){
                    Text("Switch Calculation")
                }
                
            }
            .padding()
            Spacer()
            Button("Reset Textfields"){
                firstNumberInput=nil
                secondNumberInput=nil
                
                
            }
            .buttonStyle(.bordered)
            .tint(.red)
            
            
            
            
            .navigationTitle("Currency Converter")
        }
    }
    private func convert(newValue: Int) {
        // To convert from foreign currency (F) to LKR you need to multiply the value of currency by the rate (R):
        // LKR = F * R
        if let ratesCal = rates[selectedCurrency.rawValue]{
            let result = Double(newValue) * ratesCal
            secondNumberInput = Int(result.rounded())
            
        } else {
            print("Rate not found for selected currecy")
        }
        
       
    }
    
    private func reverseConvert(newValue: Int) {
        // To convert LKR to a foreign currency you need to divide the value of currency by the rate (R):
        // F = LKR / R
        if let ratesCal = rates[selectedCurrency.rawValue]{
            let result = Double(newValue) / ratesCal
            firstNumberInput = Int(result.rounded())
        }else {
                 print("Rate not found for selected currecy")
        }
            
        }
}

#Preview {
    ContentView(selectedCurrency: .constant(.usd), defaultFoerignCurrency: .constant(.usd))
}
