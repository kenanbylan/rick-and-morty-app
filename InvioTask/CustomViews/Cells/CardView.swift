//
//  CardView.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import Foundation
import UIKit


class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        layer.borderWidth = 0.5
        if traitCollection.userInterfaceStyle == .dark {
            layer.borderColor = UIColor.black.cgColor
        } else {
            layer.borderColor = UIColor.white.cgColor
        }
    }
    
}
