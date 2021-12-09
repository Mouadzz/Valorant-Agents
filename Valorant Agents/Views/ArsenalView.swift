//
//  ArsenalView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 9/12/2021.
//

import SwiftUI

struct ArsenalView: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 20).fill(.blue).padding(.horizontal, 5)
            Text("Maps View")
            
        }.frame(width: 250)
    }
}

struct ArsenalView_Previews: PreviewProvider {
    static var previews: some View {
        ArsenalView()
    }
}
