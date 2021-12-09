//
//  CustomTabBar.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 9/12/2021.
//

import SwiftUI

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text).font(Font.custom("Valorant", size: 16)).foregroundColor(isSelected ? valColor : .gray)
    }
}

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        VStack (alignment: HorizontalAlignment.center){
            HStack(alignment: VerticalAlignment.bottom, spacing: 30) {
                TabBarButton(text: "Agents", isSelected: .constant(tabIndex == 0))
                    .onTapGesture { onButtonTapped(index: 0) }
                
                RoundedRectangle(cornerRadius: 30).fill(Color("myGray")).frame(width: 1.2, height: 20)
                
                TabBarButton(text: "Maps", isSelected: .constant(tabIndex == 1))
                    .onTapGesture { onButtonTapped(index: 1) }
                
                RoundedRectangle(cornerRadius: 30).fill(Color("myGray")).frame(width: 1.2, height: 20)
                
                TabBarButton(text: "Arsenal", isSelected: .constant(tabIndex == 2))
                    .onTapGesture { onButtonTapped(index: 2) }
            }
            RoundedRectangle(cornerRadius: 30).fill(Color("myGray")).frame(width: UIScreen.screenWidth - 50, height: 1)
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}
