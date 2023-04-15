//
//  Character.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import Foundation



struct Character: Decodable {
    
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    var image: String
    let episode: [String]
    let url: String
    let created: String
}

