//
//  AgentBioView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 11/12/2021.
//

import SwiftUI

struct AgentBioView: View {
    var agent: Datum
    
//    let agentColor:Color = getAgentPoster(name: agent.displayName).color
//    let agentPoster:String = getAgentPoster(name: agent.displayName).url
    
    var body: some View {
        Text(self.agent.displayName)
    }
}
