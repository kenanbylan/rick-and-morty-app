//
//  LocationsCollectionViewCell.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import UIKit

class LocationsCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: LocationsCollectionViewCell.self)

    @IBOutlet weak var locationLabel: UILabel!
    
    
    func setupLocations(locations: Location) {
        locationLabel.text = locations.name
        
    }

    
    

}
