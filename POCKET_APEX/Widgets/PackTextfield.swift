//
//  PackTextfield.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 16.12.2021..
//

import SwiftUI

struct PackTextfield: View {
    
    @Binding var text: String
    @Binding var season: Int
    @Binding var isDarkMode: Bool
    @State private var showAlert = false
    
    let steelGray = Color(white: 0.5)
    
    var body: some View {
        
        HStack{
            
            // Due to the limits of Swift, I couldn't format the textfield better
            TextField("Level", value: $season, format: .number)
            //.keyboardType(.numberPad)
            
            ZStack{
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(isDarkMode ? Color.red : Color.blue)
                    .frame(width: 40, height: 25)
                    .shadow(color: Color.gray, radius: 4, x: 2, y: 2)
                Button(text){
                    showAlert=true
                }.foregroundColor(Color.white)
            }.alert("Please enter season level or packs bought", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }.padding()
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(steelGray, lineWidth: 2))
        
    }
}
