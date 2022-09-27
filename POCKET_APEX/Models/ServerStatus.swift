//
//  ServerStatus.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 14.12.2021..
//

import Foundation

struct ServerStatus: Codable {
    let ea: EA
    
    enum CodingKeys: String, CodingKey {
        case ea = "EA_accounts"
    }
}

struct EA: Codable {
    let euwest: EUWest
    
    enum CodingKeys: String, CodingKey {
        case euwest = "EU-West"
    }
}

struct EUWest: Codable {
    let status: String
    let ping: Int
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case ping = "ResponseTime"
    }
}
