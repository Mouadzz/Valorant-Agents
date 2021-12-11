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
        NavigationView{
            ZStack{
                Image("background").resizable().aspectRatio(contentMode: .fill).brightness(-0.065).ignoresSafeArea()
                
                VStack (alignment: .center){
                    Image("logo").resizable().aspectRatio(contentMode: .fit)
                    
                    Text("Choose Your").font(Font.custom("Valorant", size: 25)).foregroundColor(.white)
                    
                    HStack{
                        Text("Favourite").font(Font.custom("Valorant", size: 25)).foregroundColor(.white)
                        Text("Agents").font(Font.custom("Valorant", size: 25)).foregroundColor(valColor)
                    }
                    
                    CustomTopTabBar(tabIndex: $tabIndex).padding(.top, UIScreen.screenHeight * 0.06)
                    
                    AgentsView().environmentObject(valAgents).frame(height: UIScreen.screenHeight  / 1.7)
                }
            }
        }
        .hiddenNavigationBarStyle()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ValAgents())
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
