//
//  HomeHelper.swift
//  InvioTask
//
//  Created by Kenan Baylan on 14.04.2023.
//

import Foundation



enum HomeEndpoint: String {
    
    case getLocations = "/location?page=1"
    case getCharacters = "/character"
    case getCharactersById = "/character/" //farkı array gelecektir yanınaç
    
    //https://rickandmortyapi.com/api/location?page=1
    
    var path: String {
        switch self {
            
        case .getLocations:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.getLocations.rawValue)
            
        case .getCharacters:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.getCharacters.rawValue)
            
        case .getCharactersById:
            return NetworkHelper.shared.requestUrl(url: HomeEndpoint.getCharactersById.rawValue)
        }
        
    }
}

