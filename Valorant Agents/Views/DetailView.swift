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
    
    var body: some View {
        if let agent = router.currentDetailView, router.showDetail {
            let agentColor:Color = getAgentPoster(name: agent.displayName).color
            let agentPoster:String = getAgentPoster(name: agent.displayName).url
            ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom), content:{
                agentColor
                ImageLoadingView(url: agentPoster)
                    .padding()
                    .frame(width:  UIScreen.screenWidth  / 1.8)
                    .matchedGeometryEffect(id: agent.uuid + "Poster", in: animation)
                
                GeometryReader{ reader in
                    
                    VStack{
                        BottomSheet().offset(y: reader.frame(in: .global).height - bottomSheetHeight)
                            .offset(y: offset)
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
                                            return
                                        }
                                        offset = 0
                                    }
                                    if val.startLocation.y < reader.frame(in: .global).midX{
                                        if val.translation.height < reader.frame(in: .global).midX{
                                            offset = (-reader.frame(in: .global).height + bottomSheetHeight)
                                            return
                                        }
                                        offset = 0
                                    }
                                }
                            }))
                    }
                }
                
            }).overlay(
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
            .ignoresSafeArea()
        }
    }
}

