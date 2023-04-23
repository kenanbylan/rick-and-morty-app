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
        
        if let font = UIFont(name: "AvenirNext-Medium", size: 22) {
            navigationController?.navigationBar.largeTitleTextAttributes = [.font: font]
            navigationController?.navigationBar.titleTextAttributes = [.font: font]
        }
        
        setupCharacterDetail()
    }
    
    private func setupCharacterDetail() {
        
        let episodeIDs = getEpisodeIDs(from: character.episode)
        print("character.episode : ", character.episode)
        
        self.title = character.name
        imageView.kf.setImage(with: character.image.asUrl)
        statusLabel.text = character.name
        specyLabel.text = character.species
        genderLabel.text = character.gender
        originLabel.text = character.origin.name
        locationLabel.text = character.location.name
        episodesLabel.text = episodeIDs
        createAtLabel.text = formatDate(character.created)
        
    }
    
    
    
    func getEpisodeIDs(from episodes: [String]) -> String? {
        let episodeIDs = episodes.compactMap { url -> String? in
            // URL'yi bölüp bölüm ID'sini alın
            let components = url.split(separator: "/")
            return String(components.last ?? "")
        }
        return episodeIDs.joined(separator: ",")
    }
    
    
    func formatDate(_ isoDateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: isoDateString)
        
        dateFormatter.dateFormat = "MMM d, yyyy, h:mm a"
        let dateString = dateFormatter.string(from: date!)
        return dateString
    }
    
    
    
    
    
}
