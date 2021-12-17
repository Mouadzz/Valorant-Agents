//
//  ImageLoadingView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 9/12/2021.
//

import SwiftUI

struct ImageLoadingView: View {
    @StateObject var imageloader: ImageLoader
    var isColored: Bool
    
    init (url: String?, isColored: Bool){
        self._imageloader = StateObject(wrappedValue: ImageLoader(url: url))
        self.isColored = isColored
    }
    
    var body: some View {
        
        Group {
            
            if imageloader.image != nil {
                if isColored {
                    Image(uiImage: imageloader.image!).resizable().renderingMode(.template).aspectRatio(contentMode: .fill)
                }else{
                    Image(uiImage: imageloader.image!).resizable().aspectRatio(contentMode: .fill)
                }
            }else if (imageloader.errorMessage != nil)
            {
//                Text(imageloader.errorMessage!).foregroundColor(valColor)
                
            }else{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
            
        }.onAppear {
            
            imageloader.fetch()
            
        }
        
    }
}
