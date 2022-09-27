//
//  LocationPickerScreen.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 16.12.2021..
//

import SwiftUI
import FortuneWheel

struct LocationPickerScreen: View {
    
    @Binding var isDarkMode: Bool
    @State private var locationIndex = 0
    @State private var chosenMap = 0
    @State private var showAlert: Bool = false
    @State private var showInfo: Bool = false
    
    var locations = ["Cage", "Bunker", "Airbase", "Swamps", "Market", "Labs", "Repulsor", "Runoff", "Gauntlet", "Caves"]
    var locations1 = ["Bridge", "Fragment", "Overlook", "Landslide", "Staging", "Fissure", "Lava City", "Skyhook", "Countdown", "Dome"]
    var locations2 = ["Oasis", "Barometer", "Checkpoint", "Highpoint", "Ridge", "Caves", "Siren Isle", "Trenches", "Antenna", "Wall"]
    var alertText = "Do you like the location you got? Dare to land there? If not, feel free to spin again!"
    
    var body: some View {
        
        VStack() {
            
            Picker("", selection: $chosenMap) {
                Text("Kings Canyon").tag(0)
                Text("World's Edge").tag(1)
                Text("Storm Point").tag(2)
            }
            .pickerStyle(.segmented)
            .padding(.top, 20)
            
            Spacer()
            
            if(chosenMap==0){
                
                ZStack {
                    FortuneWheel(titles: locations, size: 360, onSpinEnd: { index in
                        locationIndex = index
                        showAlert.toggle()
                    }).alert(isPresented: $showAlert) {
                        Alert(title: Text("\(locations[locationIndex])"), message: Text(alertText),dismissButton: .default(Text("Thanks!")))
                        
                    }
                }
                Spacer()
                
            }else if(chosenMap==1){
                ZStack {
                    FortuneWheel(titles: locations1, size: 360, onSpinEnd: { index in
                        locationIndex = index
                        showAlert.toggle()
                    }, pointerColor: Color.blue).alert(isPresented: $showAlert) {
                        Alert(title: Text("\(locations1[locationIndex])"), message: Text(alertText), dismissButton: .default(Text("Thanks")))
                        
                    }
                }
                Spacer()
            }else if(chosenMap==2){
                ZStack {
                    FortuneWheel(titles: locations2, size: 360, onSpinEnd: { index in
                        locationIndex = index
                        showAlert.toggle()
                    }, pointerColor: Color.yellow).alert(isPresented: $showAlert) {
                        Alert(title: Text("\(locations2[locationIndex])"), message: Text(alertText), dismissButton: .default(Text("Thanks")))
                        
                    }
                }
                Spacer()
            }
            
        }.padding()
            .navigationBarTitle("Location Picker")
            .navigationBarItems(trailing:
                                    
                                    Button {
                showInfo = true
            } label: {
                Image(systemName: "info.circle").tint(isDarkMode ? Color.red : Color.blue).alert("Choose a map and spin this magical wheel if you have no idea where to land during next game!", isPresented: $showInfo) {
                    Button("OK", role: .cancel) { }
                }
            }
                                
            )
        
    }
}
