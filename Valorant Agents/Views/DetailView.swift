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
    @State var offset: CGFloat = 0
    var bottomSheetHeight:CGFloat = UIScreen.screenHeight / 2
    @State var shouldScroll: Bool = false
    
    var body: some View {
        if let agent = router.currentDetailView, router.showDetail {
            let agentColor:Color = getAgentPoster(name: agent.displayName).color
            let agentPoster:String = getAgentPoster(name: agent.displayName).url
            ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top), content:{
                Image("background").resizable().aspectRatio(contentMode: .fill).brightness(-0.065).ignoresSafeArea().frame(width: UIScreen.screenWidth)
                LinearGradient(gradient: Gradient(colors: [agentColor, agentColor.opacity(0.6)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                Text(agent.displayName).font(Font.custom("Valorant", size: UIScreen.screenWidth / 2.5))
                    .foregroundColor(.white.opacity(0.1)).padding(.top, UIScreen.screenHeight * 0.1).multilineTextAlignment(.trailing).frame(width: UIScreen.screenWidth, alignment: .trailing)
                ImageLoadingView(url: agentPoster, isColored: false)
                    .padding()
                    .frame(width:  UIScreen.screenWidth  / 1.6)
                    .matchedGeometryEffect(id: agent.uuid + "Poster", in: animation)
                    .frame(height: UIScreen.screenHeight  / 1.5)
                    .padding(.top, UIScreen.screenHeight * 0.05)
                
                VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                    Text(agent.displayName).font(Font.custom("Valorant", size: 60)).lineLimit(1)
                        .foregroundColor(.white).padding(.leading, 25)
                    HStack (alignment: VerticalAlignment.bottom, content: {
                        ImageLoadingView(url: agent.role?.displayIcon, isColored: false)
                            .frame(width: 14, height: 14)
                        Text(agent.role!.displayName.rawValue).font(Font.custom("Valorant", size: 14)).foregroundColor(.white)
                    }).padding(.leading, 25)
                }
                .frame(width: UIScreen.screenWidth, alignment: .leading).offset(y: bottomSheetHeight - UIScreen.screenHeight * 0.04)
                GeometryReader{ reader in
                    BottomSheet(shouldScroll: $shouldScroll).environmentObject(router).offset(y: reader.frame(in: .global).height - bottomSheetHeight)
                        .offset(y: offset)
                        .padding(.top, 50)
                        .gesture(DragGesture().onChanged({ (val) in
                            withAnimation (Animation.easeIn(duration: 0.2)) {
                                if val.startLocation.y > reader.frame(in: .global).midX{
                                    if val.translation.height < 0 && offset > (-reader.frame(in: .global).height + bottomSheetHeight)
                                    {
                                        offset = val.translation.height
                                    }
                                }
                                if val.startLocation.y < reader.frame(in: .global).midX{
                                    if val.translation.height > 0 && offset < 0
                                    {
                                        offset = (-reader.frame(in: .global).height + bottomSheetHeight) + val.translation.height
                                    }
                                }
                            }
                        }).onEnded({ (val) in
                            withAnimation (Animation.easeIn(duration: 0.2)) {
                                if val.startLocation.y > reader.frame(in: .global).midX{
                                    if -val.translation.height > reader.frame(in: .global).midX{
                                        offset = (-reader.frame(in: .global).height + bottomSheetHeight)
                                        shouldScroll = true
                                        return
                                    }
                                    offset = 0
                                }
                                if val.startLocation.y < reader.frame(in: .global).midX{
                                    if val.translation.height < reader.frame(in: .global).midX{
                                        offset = (-reader.frame(in: .global).height + bottomSheetHeight)
                                        return
                                    }
                                    shouldScroll = false
                                    offset = 0
                                }
                            }
                        }))
                }.ignoresSafeArea(.all, edges: .bottom).frame(width: UIScreen.screenWidth)
            })
            .overlay(
                Button(action: {
                    withAnimation {
                        router.showDetail = false
                        offset = 0
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(VisualEffectView(effect: UIBlurEffect(style: .light)))
                        .clipShape(Circle())
                    
                }).padding(15)
                ,alignment: .topLeading
            )
            .frame(width: UIScreen.screenWidth)
        }
    }
}

