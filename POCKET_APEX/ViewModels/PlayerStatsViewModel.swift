//
//  PlayerStatsViewModel.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 11.12.2021..
//

import Combine
import Foundation

class PlayerStatsViewModel: ObservableObject {
    @Published private(set) var stats: PlayerStats? = nil
    @Published private(set) var showUserData: Bool = false
    @Published private(set) var result: Int = 0
    var task = DispatchWorkItem {}
    private var cancellable: Set<AnyCancellable> = []
    let allSeasonsValues = [
        "season1": [2, 12, 24, 34, 46],
        "season2": [12, 14, 16, 18, 20],
        "season3": [17, 21, 25, 29, 33],
        "season4": [15, 19, 23, 27, 31],
        "season5": [3, 7, 11, 17, 25, 32, 45],
        "season6": [5, 8, 11, 17, 23, 29, 45],
        "season7": [6, 9, 12, 18, 24, 30, 37, 45],
        "season8": [5, 13, 21, 29, 37, 45, 61],
        "season9": [13, 21, 29, 33, 37, 61, 77],
        "season10": [13, 21, 28, 37, 46, 72, 78],
        "season11": [13, 21, 29, 37, 61, 86, 94],
    ]
    
    func retrieveData(userName: String) {
        showUserData = true
        stats = nil
        task.cancel()
        task = DispatchWorkItem {
            if self.stats == nil {
                self.showUserData = false
            }
        }
        guard let url = URL(string: "https://api.mozambiquehe.re/bridge?version=5&platform=PC&player=\(userName)&auth=PwgNiFBihfCtESUXuMlk") else {
            fatalError("Invalid URL")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: task)
        
        let request = URLSession.shared
        request.configuration.timeoutIntervalForRequest = 9
        request.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: PlayerStats.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) }, receiveValue: { self.stats = $0 })
            .store(in: &cancellable)
    }
    
    func getNumberForSeason(seasonKey: String, seasonLevel: Int) -> Int {
        let seasonValues = allSeasonsValues[seasonKey]
        var numberToReturn = 0
        
        seasonValues?.forEach {
            if seasonLevel >= $0 {
                numberToReturn += 1
            } else {
                return
            }
        }
        return numberToReturn
    }
    
    func getPackNumber(season1: Int, season2: Int, season3: Int, season4: Int, season5: Int, season6: Int, season7: Int, season8: Int, season9: Int, season10: Int, season11: Int, bought: Int){
        var numberToReturn = bought
        numberToReturn += getNumberForSeason(seasonKey: "season1", seasonLevel: season1)
        numberToReturn += getNumberForSeason(seasonKey: "season2", seasonLevel: season2)
        numberToReturn += getNumberForSeason(seasonKey: "season3", seasonLevel: season3)
        numberToReturn += getNumberForSeason(seasonKey: "season4", seasonLevel: season4)
        numberToReturn += getNumberForSeason(seasonKey: "season5", seasonLevel: season5)
        numberToReturn += getNumberForSeason(seasonKey: "season6", seasonLevel: season6)
        numberToReturn += getNumberForSeason(seasonKey: "season7", seasonLevel: season7)
        numberToReturn += getNumberForSeason(seasonKey: "season8", seasonLevel: season8)
        numberToReturn += getNumberForSeason(seasonKey: "season9", seasonLevel: season9)
        numberToReturn += getNumberForSeason(seasonKey: "season10", seasonLevel: season10)
        numberToReturn += getNumberForSeason(seasonKey: "season11", seasonLevel: season11)
        result = numberToReturn
    }
}
