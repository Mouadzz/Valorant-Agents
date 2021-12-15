//
//  DetailView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 11/12/2021.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var router:DetailViewModel
    
    var body: some View {
        if let agent = router.currentDetailView, router.showDetail {
            ZStack{                
                VStack{
                    Spacer()
                    Text(agent.displayName).background(Color.red)
                    Spacer()
                }
            }
        }
    }
}
