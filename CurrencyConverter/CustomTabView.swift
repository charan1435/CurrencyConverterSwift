//
//  CustomTabView.swift
//  CurrencyConverter
//

//

import SwiftUI

struct CustomTabView: View {
    @State var defaultFoerignCurrency: Currencies = .usd
    @State var selectedCurrency : Currencies = .usd
    var body: some View {
        TabView{
            ContentView(selectedCurrency: $selectedCurrency, defaultFoerignCurrency: $defaultFoerignCurrency)
                .tabItem(){
                    Label("Home",systemImage: "house")
                }
            SettingsView(defaultFoerignCurrency: $defaultFoerignCurrency, selectedCurrency: $selectedCurrency)
                .tabItem(){
                    Label("Settings",systemImage: "gear")
                }
            
        }
    }
}

#Preview {
    CustomTabView()
}
