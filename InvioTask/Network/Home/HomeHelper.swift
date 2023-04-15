//
//  HomeHelper.swift
//  InvioTask
//
//  Created by Kenan Baylan on 14.04.2023.
//

import Foundation


enum HomeEndpoint: String {
    
    
    case locations = "location?page=1"
    case characters = "characters"
    
    
    var path: String {
        switch self {
            
        case .locations:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.locations.rawValue)
        case .characters:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.characters.rawValue)
        }
        
    }
}

