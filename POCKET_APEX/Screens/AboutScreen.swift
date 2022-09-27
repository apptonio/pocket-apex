//
//  AboutScreen.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 14.12.2021..
//

import SwiftUI

struct AboutScreen: View {
    
    @Binding var isDarkMode: Bool
    @State private var showDarkAlert: Bool = true
    
    var body: some View {
        VStack(spacing: 60){
            Toggle("Dark Mode", isOn: $isDarkMode)
                .toggleStyle(SwitchToggleStyle(tint: .red))
                .padding()
            
            Text("This App was made by Antonio Butigan (ab7719). Non of the data displayed by this application is owned by me, the respected owners are Origin and Apex Legends.")
            
        }.padding().alert("Due to respecting the color scheme of the game, dark mode is advised.", isPresented: .constant(showDarkAlert && !isDarkMode)) {
            
            // TODO Write
            Button("OK") {
                showDarkAlert = false
            }
        }
    }
    
}
