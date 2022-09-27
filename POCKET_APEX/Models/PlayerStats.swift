//
//  PlayerStats.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 10.12.2021..
//

import Foundation

// Professor, I am aware that Models should usually be very short files, and I could have split these up into 7 or 8 files, however to keep the simplicity I just left it like this. Thanks for understanding!
struct PlayerStats: Codable {
    let global: Global
    let legends: Legends
}

struct Global: Codable {
    let name: String
    let uid: Int
    let platform: String
    let level: Int
    let toNextLevelPercent: Int
}

struct Legends: Codable {
    let selected: SelectedLegend
}

struct SelectedLegend: Codable {
    let legendName: String
    let data: [Data]
    let gameInfo: GameInfo
    let imgAssets: ImgAssets
    
    enum CodingKeys: String, CodingKey {
        case legendName = "LegendName"
        case data
        case gameInfo
        case imgAssets = "ImgAssets"
    }
}

struct Data: Codable, Identifiable {
    var id = UUID()
    let name: String
    let value: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case value
    }
}

struct Badge: Codable, Identifiable{
    var id = UUID()
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct GameInfo: Codable {
    let skin: String
    let skinRarity: String
    let frame: String
    let frameRarity: String
    let pose: String
    let poseRarity: String
    let intro: String
    let introRarity: String
    let badges: [Badge]
}

struct ImgAssets: Codable {
    // I could not get it to work using URL's, I am aware that using Strings isn't the best solution.
    let icon: String?
    let banner: String?
}
