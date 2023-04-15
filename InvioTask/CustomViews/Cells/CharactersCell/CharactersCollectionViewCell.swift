//
//  CharactersCollectionViewCell.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import UIKit
import Kingfisher

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CharactersCollectionViewCell.self)
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var isAliveLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor(named: "green")?.cgColor
        let maskLayer = CAShapeLayer()
        let maskPath = UIBezierPath(roundedRect: characterImageView.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
    
        maskLayer.path = maskPath.cgPath
        
    }
    
    
    func setupCharactersList(character: Character) {
        characterImageView.kf.setImage(with: character.image.asUrl)
        characterName.text = character.name
        characterGender.text = character.gender
        isAliveLabel.text = character.status // değişebilir.
    }
    
    
}
