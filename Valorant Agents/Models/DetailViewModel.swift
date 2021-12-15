//
//  RoutingModel.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 11/12/2021.
//

import Foundation

class DetailViewModel: ObservableObject{
    
    @Published var currentDetailView: Datum?
    @Published var showDetail: Bool = false
}
