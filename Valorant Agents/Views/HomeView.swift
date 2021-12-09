//
//  HomeView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 8/12/2021.
//

var valColor = Color(#colorLiteral(red: 1, green: 0.27654773, blue: 0.3338484764, alpha: 1))

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var valAgents: ValAgents
    
    var body: some View {
        
        ZStack{
            // Background
            Image("background").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).ignoresSafeArea()
            
            VStack (alignment: .center){
                
                Spacer()
                
                // Logo
                Image("logo").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 145).padding(.bottom, 5)
                                
                // Title
                Text("Choose Your").font(Font.custom("Valorant", size: 25)).foregroundColor(.white)
                HStack{
                    Text("Favourite").font(Font.custom("Valorant", size: 25)).foregroundColor(.white)
                    Text("Agents").font(Font.custom("Valorant", size: 25)).foregroundColor(valColor)
                }
                
                Spacer()
                
                // Agents List View
                ScrollView(.horizontal) {
                    HStack {
                        
                        ForEach (0..<self.valAgents.agents.data.count, id:\.self) { index in
                            let agent = self.valAgents.agents.data[index] as Datum
                            
                            RoundedRectangle(cornerRadius: 20).padding(.horizontal, 10)


//                            if agent.fullPortrait != nil {
//                                ImageLoadingView(url: agent.fullPortrait!)
//                            }
                        }
                        
                         
                        
                        
                        
                        
                    }.onAppear {
                        // load Agents from Valorant Api
                        valAgents.getAgents()
                        
                        // Put Cache capacity to half GB
                        URLCache.shared.memoryCapacity = 1024 * 1024 * 512
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ValAgents())
    }
}
