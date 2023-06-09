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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        if traitCollection.userInterfaceStyle == .dark {
            locationLabel.textColor = .white
            
        } else {
            locationLabel.textColor = .black
        }
    }
    
    //This will be fixed.
    
    func setupLocations(locations: Location) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        locationLabel.isHidden = true
        
        // Fetch necessary data here
       
        locationLabel.text = locations.name
        locationLabel.isHidden = false
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    
    
    
}
