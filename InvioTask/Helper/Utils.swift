//
//  Utils.swift
//  InvioTask
//
//  Created by Kenan Baylan on 15.04.2023.
//

import Foundation



func delay(durationInSeconds seconds: Double , completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds , execute: completion)
}
