//
//  DetailView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 11/12/2021.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var router:DetailViewModel
    
    var animation:Namespace.ID
    
    var body: some View {
        if let agent = router.currentDetailView, router.showDetail {
            let agentColor:Color = getAgentPoster(name: agent.displayName).color
            let agentPoster:String = getAgentPoster(name: agent.displayName).url
            ZStack{
                agentColor
                ImageLoadingView(url: agentPoster)
                    .padding()
                    .frame(width:  UIScreen.screenWidth  / 1.8)
                    .matchedGeometryEffect(id: agent.uuid + "Poster", in: animation)
            }.overlay(
                Button(action: {
                    withAnimation {
                        router.showDetail = false
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.black)
                        .clipShape(Circle())
                        
                }).padding(10)
                ,alignment: .topLeading
            )
            .frame(width: UIScreen.screenWidth)
        }
    }
}
