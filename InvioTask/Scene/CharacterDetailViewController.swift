//
//  CharacterDetailViewController.swift
//  InvioTask
//
//  Created by Kenan Baylan on 11.04.2023.
//

import UIKit

class CharacterDetailViewController: UIViewController {

  
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    
    var character: Character!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    
    
        if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
            
            imageViewBottomConstraint.constant = -250
        } 
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        if UIDevice.current.orientation.isLandscape {
            imageViewBottomConstraint.constant = -250
        } else {
            imageViewBottomConstraint.constant = 50
        }
        
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
