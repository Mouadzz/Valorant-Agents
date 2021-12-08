//
//  HomeView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 8/12/2021.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        
        ZStack{
            // Background
            Image("background").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).ignoresSafeArea()
            
            VStack (alignment: .center){
                
                // Logo
                Image("logo").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 150)
                
                // Title
                Text("Choose Your").font(Font.custom("Valorant", size: 28)).foregroundColor(.white)
                HStack{
                    Text("Favourite").font(Font.custom("Valorant", size: 28)).foregroundColor(.white)
                    Text("Agents").font(Font.custom("Valorant", size: 28)).foregroundColor(Color(#colorLiteral(red: 1, green: 0.27654773, blue: 0.3338484764, alpha: 1)))
                }
                
                // Agents List
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(self.network.agents.data.indices, id: \.self){ index in
                        
                           // images
                            
                        }
                        
                        
                    }.onAppear {
                        network.getUsers()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Network())
    }
}
