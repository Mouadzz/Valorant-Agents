//
//  AgentsView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 9/12/2021.
//

import SwiftUI

struct AgentsView: View {
    
    @EnvironmentObject var valAgents: ValAgents
    
    var colors: [Color] = [.blue, .green, .orange, .red, .gray, .pink, .yellow]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: UIScreen.screenWidth * 0.05){
                ForEach (0..<self.valAgents.agents.data.count, id:\.self) { index in
                    let agent = self.valAgents.agents.data[index] as Datum
                    GeometryReader { geometry in
                        ZStack{
                            Color.purple.brightness(-0.5)
                            if agent.fullPortrait != nil{
                                ImageLoadingView(url: agent.fullPortrait!)
                            }
                        }.cornerRadius(20)
                            .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - (UIScreen.screenWidth  / 3.6) + UIScreen.screenWidth * 0.05) / -15), axis: (x: 0, y: 1.0, z: 0))
                    }.frame(width: UIScreen.screenWidth  / 1.8)
                }
            }.padding(.vertical, UIScreen.screenHeight * 0.03).padding(.horizontal, UIScreen.screenWidth  / 3.6)
        }
    }
}

struct AgentsView_Previews: PreviewProvider {
    static var previews: some View {
        AgentsView().environmentObject(ValAgents())
    }
}
