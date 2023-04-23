//
//  Location.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import Foundation

struct LocationResponse: Codable {
    let locations: [Location]

    enum CodingKeys: String, CodingKey {
        case locations = "results"
    }
    
    var residentsWithDetails: [Character]?
    
    func makeIterator() -> IndexingIterator<[Location]> {
           return locations.makeIterator()
    }
}

struct Location: Codable {
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dimension
        case residents
        case url
        case created
    }
}


