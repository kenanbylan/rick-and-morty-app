//
//  CharactersCollectionViewCell.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.

import UIKit
import Kingfisher


enum Gender: String {
    case male = "Male"
    case female = "Female"
    case unknow = "Unknow"
}

enum Status : String {
    
    case alive = "Alive"
    case dead = "Dead"
    case unknow = "Unknow"
}


class CharactersCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: instance
    static let identifier = String(describing: CharactersCollectionViewCell.self)
    
    //MARK: UIElements
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var isAliveLabel: UILabel!
    
    @IBOutlet weak var isAliveImageView: UIImageView!
    @IBOutlet weak var genderImageView: UIImageView!
    
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var deadLabel: UILabel!
    
    
    //MARK: Properties
    var isCharacterGender: String?
    var isAlive: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 10
        let maskLayer = CAShapeLayer()
        let maskPath = UIBezierPath(roundedRect: characterImageView.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 10, height: 10))
        maskLayer.path = maskPath.cgPath
        
    }
    
    
    //MARK: Setup Characters.
    func setupCharactersList(character: Character) {
        
        characterImageView.kf.setImage(with: character.image.asUrl)
        characterName.text = character.name
        isCharacterGender = character.gender
        isAlive = character.status
        
        if let gender = isCharacterGender, let status = isAlive {
            
            if gender == Gender.female.rawValue {
                genderImageView.image = UIImage(named: "female")
                femaleLabel.text = "female"
                femaleLabel.textColor = .systemPink
            } else if gender == Gender.male.rawValue {
                genderImageView.image = UIImage(named: "male")
                femaleLabel.text = "male"
                femaleLabel.textColor = .systemBlue
            } else {
                genderImageView.image = UIImage(named: "unknown")
                femaleLabel.text = "unknown"
                femaleLabel.textColor = .none
            }
            
            if status == Status.alive.rawValue {
                
                isAliveImageView.image = UIImage(named: "alive")
                deadLabel.text = "alive"
                deadLabel.textColor = .systemGreen
            } else if status == Status.dead.rawValue {
                
                isAliveImageView.image = UIImage(named: "dead")
                deadLabel.text = "dead"
                deadLabel.textColor = .red
                
            } else {
                isAliveImageView.image = UIImage(named: "unknown")
                deadLabel.text = "unknown"
                deadLabel.textColor = .none
            }
        } else {
            genderImageView.image = UIImage(named: "unknown")
            isAliveImageView.image = UIImage(named: "unknown")
        }
    }
    
    
    
}
