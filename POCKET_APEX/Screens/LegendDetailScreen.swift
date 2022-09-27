//
//  LegendDetailScreen.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 15.12.2021..
//

import SwiftUI
import SDWebImageSwiftUI

struct LegendDetailScreen: View {
    
    @State var legendName: String = ""
    @State var legendBanner: String = ""
    
    var body: some View {
        Spacer()
        Text(legendName).font(.largeTitle)
        
        Spacer()
        WebImage(url: URL(string: legendBanner))
            .resizable()
            .placeholder(Image(systemName: "photo"))
            .placeholder {
                ZStack{
                    Rectangle().foregroundColor(Color.black)
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.red)).scaleEffect(3) 
                }
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 500)
        Spacer()
        Spacer()
    }
}
