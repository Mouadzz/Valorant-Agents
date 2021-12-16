//
//  BottomSheet.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 16/12/2021.
//

import SwiftUI

struct BottomSheet: View {
    @EnvironmentObject var router:DetailViewModel

    var body: some View {
        
        if let agent = router.currentDetailView, router.showDetail {
            VStack{
                Capsule().fill(Color.gray.opacity(0.5))
                    .frame(width: 100, height: 3)
                    .padding(.top, 5)
                
                HStack {
                    ImageLoadingView(url: agent.displayIcon)
                    Text("BIO")
                }
                
                
                
                
            }
            .frame(width: UIScreen.screenWidth)
            .background(VisualEffectView(effect: UIBlurEffect(style: .light)))
            .cornerRadius(25)
            .padding(.top, 50)
        }
    }
}
