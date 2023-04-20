//  LoadingViewController.swift
//  InvioTask
//  Created by Kenan Baylan on 15.04.2023.

import UIKit
import Lottie

class LoadingViewController: UIViewController {
    
    //MARK: UIElements
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: Variables
    private let isUserLogin = true
    private let defaults = UserDefaults.standard
    
    let animationView = LottieAnimationView()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if defaults.bool(forKey: "hasOpenedBefore") {
            // Uygulama daha önce açılmış. Hello yazdır.
            welcomeLabel.text = "Hello!"
        } else {
            // Uygulama ilk defa açılıyor. Welcome yazdır ve hasOpenedBefore değerini kaydet.
            defaults.set(true, forKey: "hasOpenedBefore")
        }
        
        showHomeView()
        setupAnimationView()
    }
    
    private func setupAnimationView() {
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(durationInSeconds: 2.0) {
            //    self.animationView.stop()
            self.showHomeView()
        }
    }
    
    
    private func showHomeView() {
        if isUserLogin {
            performSegue(withIdentifier: "toHomeNC", sender: nil)
            
           // let navigationController = UINavigationController(rootViewController: HomeViewController())
           // present(navigationController, animated: true, completion: nil)
            
        } else {
            
        }
        
    }
    
}
