//
//  String + Extension.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import Foundation


extension String {
    //for kingfisher image url
    
    
    var asUrl: URL? {
        return URL(string: self)
    }
    
    
}
