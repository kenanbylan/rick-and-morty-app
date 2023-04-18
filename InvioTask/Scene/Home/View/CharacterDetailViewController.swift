//
//  CharacterDetailViewController.swift
//  InvioTask
//
//  Created by Kenan Baylan on 11.04.2023.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {
    
    var character: Character!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var specyLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCharacterDetail()
        
    }
    
    private func setupCharacterDetail() {
        
        self.title = character.name
        imageView.kf.setImage(with: character.image.asUrl)
        statusLabel.text = character.name
        specyLabel.text = character.species
        genderLabel.text = character.gender
        originLabel.text = character.origin.name
        locationLabel.text = character.location.name
        episodesLabel.text = "1,2,3,4,6,7,8,9"   //MARK: Düzenlenecektir.
        createAtLabel.text = character.created
        
        
    }
    
    
    



  

}
