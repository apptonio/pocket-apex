//
//  PackCalculatorScreen.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 16.12.2021..
//

import SwiftUI

struct PackCalculatorScreen: View {
    
    // I'm sorry I didn't have time to optimize this page more (too many vars)
    // Also, since all of these levels in the textfields CAN be zero, I cannot disable the button...
    @ObservedObject private var player = PlayerStatsViewModel()
    
    @State var season1: Int = 0
    @State var season2: Int = 0
    @State var season3: Int = 0
    @State var season4: Int = 0
    @State var season5: Int = 0
    @State var season6: Int = 0
    @State var season7: Int = 0
    @State var season8: Int = 0
    @State var season9: Int = 0
    @State var season10: Int = 0
    @State var season11: Int = 0
    @State var bought: Int = 0
    
    @State var text1: String = "S1"
    @State var text2: String = "S2"
    @State var text3: String = "S3"
    @State var text4: String = "S4"
    @State var text5: String = "S5"
    @State var text6: String = "S6"
    @State var text7: String = "S7"
    @State var text8: String = "S8"
    @State var text9: String = "S9"
    @State var text10: String = "S10"
    @State var text11: String = "S11"
    @State var text12: String = "$"
    
    @State private var showAlert: Bool = false
    @State private var showInfo: Bool = false
    @Binding var isDarkMode: Bool
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            HStack(spacing: 24){
                PackTextfield(text: $text1, season: $season1, isDarkMode: $isDarkMode)
                PackTextfield(text: $text2, season: $season2, isDarkMode: $isDarkMode)
            }
            HStack(spacing: 24){
                PackTextfield(text: $text3, season: $season3, isDarkMode: $isDarkMode)
                PackTextfield(text: $text4, season: $season4, isDarkMode: $isDarkMode)
            }
            HStack(spacing: 24){
                PackTextfield(text: $text5, season: $season5, isDarkMode: $isDarkMode)
                PackTextfield(text: $text6, season: $season6, isDarkMode: $isDarkMode)
            }
            HStack(spacing: 24){
                PackTextfield(text: $text7, season: $season7, isDarkMode: $isDarkMode)
                PackTextfield(text: $text8, season: $season8, isDarkMode: $isDarkMode)
            }
            HStack(spacing: 24){
                PackTextfield(text: $text9, season: $season9, isDarkMode: $isDarkMode)
                PackTextfield(text: $text10, season: $season10, isDarkMode: $isDarkMode)
            }
            HStack(spacing: 24){
                PackTextfield(text: $text11, season: $season11, isDarkMode: $isDarkMode)
                PackTextfield(text: $text12, season: $bought, isDarkMode: $isDarkMode)
            }
            
            Button("Calculate!") {
                player.getPackNumber(season1: season1, season2: season2, season3: season3, season4: season4, season5: season5, season6: season6, season7: season7, season8: season8, season9: season9, season10: season10, season11: season11, bought: bought)
                showAlert = true
            }.alert("You opened \(player.result) packs so far!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            
        }.padding()
            .navigationBarTitle("Pack Calculator")
            .navigationBarItems(trailing:
                                    
                                    Button {
                showInfo = true
            } label: {
                Image(systemName: "info.circle").tint(isDarkMode ? Color.red : Color.blue).alert("Here you can calculate how many packs you opened, by entering your season levels!", isPresented: $showInfo) {
                    Button("OK", role: .cancel) { }
                }
            }
                                
                                
                                
                                
            )
        
    }
    
}
