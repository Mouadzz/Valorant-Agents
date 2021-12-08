//
//  ImageLoader.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 8/12/2021.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var data: Data?
    
    func loadData(from urlString: String?) {
        if let urlString = urlString {
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.data = data
                }
            }
            task.resume()
        }
    }
}
