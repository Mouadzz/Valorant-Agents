//
//  ImageLoadingView.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 9/12/2021.
//

import SwiftUI

struct ImageLoadingView: View {
    @StateObject var imageloader: ImageLoader
    
    init (url: String?){
        self._imageloader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        
        Group {
            
            if imageloader.image != nil {
                Image(uiImage: imageloader.image!).resizable().aspectRatio(contentMode: .fill)
            }else if (imageloader.errorMessage != nil)
            {
                Text(imageloader.errorMessage!).foregroundColor(valColor)
                
            }else{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
            
        }.onAppear {
            
            imageloader.fetch()
            
        }
        
    }
}

struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingView(url: nil)
    }
}

