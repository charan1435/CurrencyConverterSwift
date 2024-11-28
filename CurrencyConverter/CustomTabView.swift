//
//  CustomTabView.swift
//  CurrencyConverter
//
//  Created by Sabith Salman on 2024-11-28.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem(){
                    Label("Home",systemImage: "house")
                }
            SettingsView()
                .tabItem(){
                    Label("Settings",systemImage: "gear")
                }
            
        }
    }
}

#Preview {
    CustomTabView()
}
