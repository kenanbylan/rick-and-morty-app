//
//  Array + Extension.swift
//  InvioTask
//
//  Created by Kenan Baylan on 17.04.2023.
//

import Foundation


extension Array where Element == String {
    func characterIDs() -> [Int] {
        return compactMap { Int($0.components(separatedBy: "/").last ?? "") }
    }
}
