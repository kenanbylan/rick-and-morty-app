//  HomeCoordinator.swift
//  InvioTask
//  Created by Kenan Baylan on 17.04.2023.


import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    
    // var filterSelection: ((MovieCategory)->())?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    
}
