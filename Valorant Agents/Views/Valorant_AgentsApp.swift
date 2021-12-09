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

    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(valAgents)
        }
    }
}
