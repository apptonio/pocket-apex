//
//  StatsScreen.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 16.12.2021..
//

import SwiftUI
import SDWebImageSwiftUI

struct StatsScreen: View {
    
    @ObservedObject private var player = PlayerStatsViewModel()
    @ObservedObject private var server = ServerStatusViewModel()
    
    // I set the username for easier testing, you can also try "SipinTeaInUrHood"
    @State private var userName = "Br0nzeGawD"
    @Binding var isDarkMode: Bool
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            if !player.showUserData{
                
                Spacer()
                Text("To see your stats, please enter your Apex username below, or click another tab.").multilineTextAlignment(.center).foregroundColor(isDarkMode ? Color.gray : Color.black)
                Spacer()
            }
            
            
            TextField("Player name", text: $userName)
                .multilineTextAlignment(.center)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isDarkMode ? Color.red : Color.blue, lineWidth: 2)
                )
                .onSubmit {
                    guard userName.isEmpty == false else { return }
                    player.retrieveData(userName: userName)
                }
            
            Button("Go!") {
                player.retrieveData(userName: userName)
            }.disabled(userName.isEmpty)
            
            if !player.showUserData{
                
                Spacer()
                Spacer()
                if(server.server?.ea.euwest.status == "UP"){
                    HStack{
                        Text("Servers are " + (server.server?.ea.euwest.status.lowercased() ?? "") + "!").foregroundColor(isDarkMode ? Color.gray : Color.black)
                        Circle().fill(Color.green).frame(width: 24, height: 24).shadow(color: Color.white, radius: 4, x: 0, y: 0)
                        
                    }
                }
                else if(server.server?.ea.euwest.status == "DOWN"){
                    HStack{
                        Text("Servers are " + (server.server?.ea.euwest.status.lowercased() ?? "") + "!").foregroundColor(isDarkMode ? Color.gray : Color.black)
                        Circle().fill(Color.red).frame(width: 24, height: 24).shadow(color: Color.white, radius: 4, x: 0, y: 0)
                        
                    }
                }
                else if(server.server?.ea.euwest.status == "SLOW"){
                    HStack{
                        Text("Servers are " + (server.server?.ea.euwest.status.lowercased() ?? "") + "!").foregroundColor(isDarkMode ? Color.gray : Color.black)
                        Circle().fill(Color.yellow).frame(width: 24, height: 24).shadow(color: Color.white, radius: 4, x: 0, y: 0)
                        
                    }
                }
                else if(server.server?.ea.euwest.status == "OVERLOADED"){
                    HStack{
                        Text("Servers are " + (server.server?.ea.euwest.status.lowercased() ?? "") + "!").foregroundColor(isDarkMode ? Color.gray : Color.black)
                        Circle().fill(Color.orange).frame(width: 24, height: 24).shadow(color: Color.white, radius: 4, x: 0, y: 0)
                        
                    }
                }
                
            }
            
            
            if player.showUserData {
                
                VStack(spacing: 24){
                    
                    NavigationLink(destination: LegendDetailScreen(legendName: player.stats?.legends.selected.legendName ?? "", legendBanner: player.stats?.legends.selected.imgAssets.banner ?? "")) {
                        WebImage(url: URL(string: player.stats?.legends.selected.imgAssets.icon ?? ""))
                            .resizable()
                            .placeholder(Image(systemName: "photo"))
                            .placeholder {
                                ZStack{
                                    Rectangle().foregroundColor(isDarkMode ? Color.black : Color.white)
                                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: isDarkMode ? Color.red : Color.blue)).scaleEffect(3)
                                }
                            }
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: 300)
                        
                    }
                    
                    List {
                        
                        Section{
                            HStack{
                                Text("Apex Username:")
                                Spacer()
                                Text(player.stats?.global.name ?? "Loading...")
                            }.lineLimit(1)
                            HStack{
                                Text("Legend Name:")
                                Spacer()
                                Text(player.stats?.legends.selected.legendName ?? "Loading...")
                            }.lineLimit(1)
                            HStack{
                                Text("Platform:")
                                Spacer()
                                Text(player.stats?.global.platform ?? "Loading...")
                            }.lineLimit(1)
                            HStack{
                                Text("Account Level:")
                                Spacer()
                                Text(String(player.stats?.global.level ?? 0))
                            }.lineLimit(1)
                            HStack{
                                Text("To next level:")
                                Spacer()
                                Text(String(player.stats?.global.toNextLevelPercent ?? 0) + "%")
                            }.lineLimit(1)
                            
                            
                        }header: {
                            Text("Account Stats").foregroundColor(isDarkMode ? Color.red : Color.blue)
                        }
                        
                        Section{
                            ForEach(player.stats?.legends.selected.data ?? []) { tracker in
                                
                                HStack{
                                    Text(tracker.name + ":")
                                    Spacer()
                                    Text(String(tracker.value))
                                }.lineLimit(1)
                                
                            }
                        }header: {
                            Text("Equipped Trackers").foregroundColor(isDarkMode ? Color.red : Color.blue)
                        }
                        
                        Section{
                            
                            HStack{
                                Text("Skin:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.skin ?? "skin")
                            }.lineLimit(1)
                            
                            HStack{
                                Text("Skin Rarity:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.skinRarity ?? "skin")
                            }.lineLimit(1)
                            
                            HStack{
                                Text("Frame:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.frame ?? "skin")
                            }.lineLimit(1)
                            
                            HStack{
                                Text("Frame Rarity:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.frameRarity ?? "skin")
                            }.lineLimit(1)
                            
                            HStack{
                                Text("Pose:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.pose ?? "skin")
                            }.lineLimit(1)
                            
                            HStack{
                                Text("Pose Rarity:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.poseRarity ?? "skin")
                            }.lineLimit(1)
                            
                            HStack{
                                Text("Intro:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.intro ?? "skin")
                            }.lineLimit(1)
                            
                            HStack{
                                Text("Intro Rarity:")
                                Spacer()
                                Text(player.stats?.legends.selected.gameInfo.introRarity ?? "skin")
                            }.lineLimit(1)
                            
                        }header: {
                            Text("Equipped Cosmetics").foregroundColor(isDarkMode ? Color.red : Color.blue)
                        }
                        
                        Section{
                            
                            ForEach(player.stats?.legends.selected.gameInfo.badges ?? []) { badge in
                                
                                HStack{
                                    Text("Badge:")
                                    Spacer()
                                    Text(badge.name)
                                }.lineLimit(1)
                                
                            }
                        }header: {
                            Text("Equipped Badges").foregroundColor(isDarkMode ? Color.red : Color.blue)
                        }
                        
                    }.listStyle(.insetGrouped)
                    
                }
                
            }
            
        }.padding()
            .navigationBarTitle(player.showUserData ? "Player Stats" : "Pocket Apex")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: AboutScreen(isDarkMode: $isDarkMode)) {
                Image(systemName: "gearshape").tint(isDarkMode ? Color.red : Color.blue)
            })
        
    }
}
