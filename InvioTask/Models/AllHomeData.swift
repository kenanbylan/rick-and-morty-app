//
//  AllHomeData.swift
//  InvioTask
//
//  Created by Kenan Baylan on 14.04.2023.
//

import Foundation



struct AllHome: Decodable {
    let locations: [Location]?
    let characters: [Character]?
}
