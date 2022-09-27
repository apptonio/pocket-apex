//
//  ContentView.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 05.12.2021..
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDarkMode: Bool = true

    var body: some View {
        
        TabView{
        
            NavigationView {
                StatsScreen(isDarkMode: $isDarkMode)
            }
            .tabItem {
                Image(systemName: "person.text.rectangle")
                Text("Stats")
            }
            
            NavigationView {
                PackCalculatorScreen(isDarkMode: $isDarkMode)
            }
            .tabItem {
                Image(systemName: "circle.grid.cross")
                Text("Calculator")
            }
            
            NavigationView {
                LocationPickerScreen(isDarkMode: $isDarkMode)
            }
            .tabItem {
                Image(systemName: "mappin.and.ellipse")
                Text("Picker")
            }
            
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            .accentColor(isDarkMode ? .red : .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
