//
//  Network.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 8/12/2021.
//

import Foundation
import SwiftUI


class Network: ObservableObject {
    @Published var agents: AgentsModel = AgentsModel(status: 0, data: [])
    var imageLoader = ImageLoader()
    

    
    
    func getUsers() {
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedModel = try JSONDecoder().decode(AgentsModel.self, from: data)
                        self.agents = decodedModel
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
