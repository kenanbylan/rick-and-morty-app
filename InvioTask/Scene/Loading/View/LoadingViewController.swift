//  LoadingViewController.swift
//  InvioTask
//  Created by Kenan Baylan on 15.04.2023.

import UIKit


class LoadingViewController: UIViewController {
    
    //MARK: UIElements
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: Variables
    private let isUserLogin = true
    private let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Splash screen hello or welcome text.
        if defaults.bool(forKey: "hasOpenedBefore") {
            welcomeLabel.text = "Hello!"
        } else {
            defaults.set(true, forKey: "hasOpenedBefore")
        }
        
        viewAnimation()
        showHomeView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(durationInSeconds: 2.0) {
            self.showHomeView()
        }
    }
    
    
    
    
    private func viewAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            self.imageView.alpha = 0.0
        }, completion: nil)
        
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 1.5
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        view.layer.add(animation, forKey: "opacity")
        
    }
    
    
    private func showHomeView() {
        if isUserLogin {
            performSegue(withIdentifier: "toHomeNC", sender: nil)
        }
    }
    
    
}
