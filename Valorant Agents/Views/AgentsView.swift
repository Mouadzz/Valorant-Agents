//
//  AgentsView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 9/12/2021.
//

import SwiftUI

struct AgentsView: View {
    
    @EnvironmentObject var valAgents: ValAgents
    let cardWidth:CGFloat = UIScreen.screenWidth  / 1.8
    var HPadding:CGFloat =  ((UIScreen.screenWidth  - (UIScreen.screenWidth  / 1.8)) / 2)
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: UIScreen.screenWidth * 0.013){
                ForEach (self.valAgents.agents.data.indices, id:\.self) { index in
                    let agent = self.valAgents.agents.data[index] as Datum
                    let agentColor:Color = getAgentPoster(name: agent.displayName).color
                    let agentPoster:String = getAgentPoster(name: agent.displayName).url
                    if agent.fullPortrait != nil{
                        GeometryReader { geometry in
                            ZStack{
                                
                                LinearGradient(gradient: Gradient(colors: [agentColor, agentColor.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                                ImageLoadingView(url: agentPoster).padding().frame(width: cardWidth)
                                
                                ZStack {
//
                                    VStack{
                                        Text(agent.displayName).font(Font.custom("Valorant", size: 20)).foregroundColor(.white)
                                        Text("\(agent.role!.displayName)" as String).font(Font.custom("Valorant", size: 10)).foregroundColor(.white)
                                    }.frame(width: cardWidth).background(Color("gray").blur(radius: 10))
                                }
                                
                            }.cornerRadius(20)
                            .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - Double(HPadding)) / -12), axis: (x: 0, y: 1.0, z: 0))
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
//
//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//
//struct RoundedCorner: Shape {
//
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
