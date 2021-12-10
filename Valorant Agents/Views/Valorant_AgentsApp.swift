//
//  Valorant_AgentsApp.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 8/12/2021.
//

import SwiftUI

@main
struct Valorant_AgentsApp: App {
    var valAgents = ValAgents()
    
    init () {
        // load Agents from Valorant Api
        valAgents.getAgents()
        
        // Put Cache capacity to half GB
        URLCache.shared.memoryCapacity = 1024 * 1024 * 512
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(valAgents)
        }
    }
}
