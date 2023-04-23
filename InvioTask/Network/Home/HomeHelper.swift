//
//  HomeHelper.swift
//  InvioTask
//
//  Created by Kenan Baylan on 14.04.2023.
//

import Foundation



enum HomeEndpoint: String {
    
    case getLocations = "/location?page="
    case getCharacters = "/character"
    case getCharactersById = "/character/"
    
    //https://rickandmortyapi.com/api/location?page=1
    
    //MARK: -Example: HomeEnpoint.getLocations.path
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

