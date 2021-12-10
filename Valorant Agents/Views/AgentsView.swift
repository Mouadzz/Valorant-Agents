//
//  AgentsView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 9/12/2021.
//

import SwiftUI

struct AgentsView: View {
    
    @EnvironmentObject var valAgents: ValAgents
    
    let cardWidth:Double = UIScreen.screenWidth  / 1.8
    var HPadding:Double =  ((UIScreen.screenWidth  - (UIScreen.screenWidth  / 1.8)) / 2)
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: UIScreen.screenWidth * 0.01){
                ForEach (self.valAgents.agents.data.indices, id:\.self) { index in
                    let agent = self.valAgents.agents.data[index] as Datum
                    if agent.fullPortrait != nil{
                        GeometryReader { geometry in
                            ZStack{
                                Color.purple.brightness(-0.5)
                                VStack{
                                    Text("\(geometry.frame(in: .global).minX)").foregroundColor(.white)

                                    ImageLoadingView(url: agent.fullPortrait!)
                                }
                                
                            }.cornerRadius(20)
                                .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - HPadding) / -12), axis: (x: 0, y: 1.0, z: 0))
                        }.frame(width: cardWidth)
                        
                    }
                }
            }.frame(maxHeight: .infinity).padding(.vertical, UIScreen.screenHeight * 0.05).padding(.horizontal, HPadding)
        }.frame(width: UIScreen.screenWidth)
    }
}

struct AgentsView_Previews: PreviewProvider {
    static var previews: some View {
        AgentsView().environmentObject(ValAgents())
    }
}
