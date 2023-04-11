//
//  HomeViewController.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var locationsCollectionView: UICollectionView!
    @IBOutlet weak var characterCollectionView: UICollectionView!
    
    
    var locations: [Location] = [
        Location(id: 1, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 2, name: "Earth", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Cita", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "CEarthita", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Cita", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Earth", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "CiAbadongata", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Cita", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Earth", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Cita", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
        Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1"),
    ]
    
    var charachter: [Character] = [
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        Character(id: 1, name: "Beth Smith", status: "Alive", species: "Human", type: "Alive", gender: "Female", origin:         Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  
                  , location: Location(id: 3, name: "Abadonga", type: "1", dimension: "1", residents: "1", url: "1", created: "1")
                  , image: "https://picsum.photos/100/223", episode: ["1","2"], url: "https://picsum.photos/100/223", created: "deneme"),
        
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellNibs()
    }
    
    
    private func registerCellNibs() {
        let locationNibName = LocationsCollectionViewCell.identifier
        locationsCollectionView.register(UINib(nibName: locationNibName, bundle: nil), forCellWithReuseIdentifier: locationNibName)
        
        let characterNibname = CharactersCollectionViewCell.identifier
        characterCollectionView.register(UINib(nibName: characterNibname, bundle: nil), forCellWithReuseIdentifier: characterNibname)
        
        
    }
    
}


extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case locationsCollectionView:
            return locations.count
        
        case characterCollectionView:
            return charachter.count
            
        default:
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
            
            //MARK: -bu kısmı geliştir ayrı bir class olarak ayarla dolabilir.
        case locationsCollectionView:
            let locationCellIdentifier = LocationsCollectionViewCell.identifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: locationCellIdentifier, for: indexPath) as! LocationsCollectionViewCell
            cell.setupLocations(locations: locations[indexPath.row])
            return cell
            
        case characterCollectionView:
            let characterCellIdentifier = CharactersCollectionViewCell.identifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCellIdentifier, for: indexPath) as! CharactersCollectionViewCell
            cell.setupCharactersList(character: charachter[indexPath.row])
            return cell
            
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    
    
    
    
    
    
}
