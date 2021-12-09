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
    
    @State var tabIndex = 0
    
    
    var body: some View {
        
        ZStack{
            // Background
            Image("background").resizable().aspectRatio(contentMode: .fill).brightness(-0.065).ignoresSafeArea()
            
            VStack (alignment: .center){
                // Logo
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: UIScreen.screenWidth / 2.6).padding(.bottom, 5).padding(.top, UIScreen.screenHeight * 0.05)
                
                // Title
                Text("Choose Your").font(Font.custom("Valorant", size: 23)).foregroundColor(.white)
                HStack{
                    Text("Favourite").font(Font.custom("Valorant", size: 23)).foregroundColor(.white)
                    Text("Agents").font(Font.custom("Valorant", size: 23)).foregroundColor(valColor)
                }
                
                CustomTopTabBar(tabIndex: $tabIndex).padding(.top, UIScreen.screenHeight * 0.05)
                            
                AgentsView().environmentObject(valAgents).onAppear {
                    // load Agents from Valorant Api
                    valAgents.getAgents()
                    
                    // Put Cache capacity to half GB
                    URLCache.shared.memoryCapacity = 1024 * 1024 * 512
                }.frame(height: UIScreen.screenHeight  / 1.6)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ValAgents())
    }
}

