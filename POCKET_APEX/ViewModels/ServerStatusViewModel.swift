//
//  ServerStatusViewModel.swift
//  POCKET_APEX
//
//  Created by Antonio Butigan on 15.12.2021..
//

import Foundation
import Combine

class ServerStatusViewModel: ObservableObject {
    
    @Published private(set) var server: ServerStatus? = nil
    
    private var cancellable: Set<AnyCancellable> = []
    
    init(){
        retrieveData()
    }
    
    func retrieveData() {
        
        guard let url = URL(string: "https://api.mozambiquehe.re/servers?auth=PwgNiFBihfCtESUXuMlk") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({$0.data})
            .decode(type: ServerStatus.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {print($0)}, receiveValue: {self.server = $0})
            .store(in: &cancellable)
        
    }
    
}


