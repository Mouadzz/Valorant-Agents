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
    @EnvironmentObject var router:DetailViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: UIScreen.screenWidth * 0.013){
                ForEach (self.valAgents.agents.data.indices.reversed(), id:\.self) { index in
                    let agent = self.valAgents.agents.data[index] as Datum
                    let agentColor:Color = getAgentPoster(name: agent.displayName).color
                    let agentPoster:String = getAgentPoster(name: agent.displayName).url
                    if agent.fullPortrait != nil{
                        
                        Button {
                            withAnimation (.spring()) {
                                router.currentDetailView = agent
                                router.showDetail = true
                            }
                        } label: {
                            GeometryReader { geometry in
                                ZStack{
                                    LinearGradient(gradient: Gradient(colors: [agentColor, agentColor.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                                    ImageLoadingView(url: agentPoster)
                                        .padding()
                                        .frame(width: cardWidth)
                                    VStack{
                                        Spacer()
                                        VStack{
                                            Text(agent.displayName).font(Font.custom("Valorant", size: 20))
                                                .foregroundColor(.white)
                                            Text("\(agent.role!.displayName)" as String).font(Font.custom("Valorant", size: 10))
                                                .foregroundColor(.white)
                                        }.frame(width: cardWidth).padding(.vertical,10)
                                        .background(VisualEffectView(effect: UIBlurEffect(style: .light)))
                                    }
                                }
                                .cornerRadius(20, corners: [.topRight, .topLeft , .bottomLeft])
                                .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - Double(HPadding)) / -12), axis: (x: 0, y: 1.0, z: 0))
                            }
                            .frame(width: cardWidth)
                        }.buttonStyle(CardButtonStyle())
                    }
                }
            }.frame(maxHeight: .infinity).padding(.vertical, UIScreen.screenHeight * 0.05).padding(.horizontal, HPadding)
        }.frame(width: UIScreen.screenWidth)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct CardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label.scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.easeIn, value: configuration.isPressed)
    }
}
