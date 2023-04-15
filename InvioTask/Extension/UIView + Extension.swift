//
//  UIView + Extension.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.
//

import UIKit


extension UIView {
        
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { return self.layer.cornerRadius = newValue }
    }
    
    
}
