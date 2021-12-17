//
//  BottomSheet.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 16/12/2021.
//

import SwiftUI

struct BottomSheet: View {
    @EnvironmentObject var router:DetailViewModel
    
    
    @Binding var shouldScroll: Bool
    
    
    private var axes: Axis.Set {
        return shouldScroll ? .vertical : []
    }
    
    var body: some View {
        
        if let agent = router.currentDetailView, router.showDetail {
            let agentColor:Color = getAgentPoster(name: agent.displayName).color
            VStack (content: {
                Capsule().fill(Color.white.opacity(0.7))
                    .frame(width: 100, height: 3)
                    .padding(.top, 5).padding(.bottom, 15)
                ScrollView(axes, showsIndicators: false, content: {
                    
                    VStack(alignment: .leading){
                        Text("BIO").font(Font.custom("Valorant", size: 28))
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        
                        Text(agent.datumDescription).font(Font.custom("Valorant", size: 13))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        Text("Special abilities").font(Font.custom("Valorant", size: 28))
                            .foregroundColor(.white).padding(.bottom, 5)
                        ForEach (agent.abilities.indices, id:\.self) { index in
                            VStack (alignment: .leading,  content: {
                                HStack (alignment: VerticalAlignment.center , content: {
                                    ImageLoadingView(url: agent.abilities[index].displayIcon, isColored: true)
                                        .frame(width: 30, height: 30).foregroundColor(agentColor)
                                    Text(agent.abilities[index].displayName).font(Font.custom("Valorant", size: 18)).foregroundColor(.white).padding(.leading, 5)
                                    Spacer()
                                }).padding(.bottom, 3)
                                Text(agent.abilities[index].abilityDescription).font(Font.custom("Valorant", size: 13)).foregroundColor(.white).lineLimit(nil)
                            }).padding().border(agentColor, width: 1).cornerRadius(20)
                        }
                        
                    }.padding(.top, 15)
                    
                })
                
            }).padding(.horizontal, 25).padding(.bottom, 15)
            .frame(width: UIScreen.screenWidth)
            .background(VisualEffectView(effect: UIBlurEffect(style: .light)))
            .cornerRadius(25, corners: [.topLeft, .topRight])
            .padding(.top, 50)
        }
    }
}
