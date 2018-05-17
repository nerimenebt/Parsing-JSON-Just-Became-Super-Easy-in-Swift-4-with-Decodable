//
//  View.swift
//  Json Parsing swift 4
//
//  Created by Nerimene  on 16/05/2018.
//  Copyright © 2018 Nerimene . All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shouldRasterize: Bool {
        get {
            return self.layer.shouldRasterize
        }
        set {
            self.layer.shouldRasterize = newValue
        }
    }
    
    @IBInspectable var roundedByHeight: Bool {
        get {
            return self.layer.cornerRadius == self.frame.height
        }
        set {
            if newValue == true {
                self.layer.cornerRadius = self.frame.height / 8
                self.layer.masksToBounds = true
                
            } else {
                self.layer.cornerRadius = 0
            }
            
        }
    }
    
    @IBInspectable var roundedCircle: Bool {
        get {
            return self.layer.cornerRadius == self.frame.height/2
        }
        set {
            if newValue == true {
                self.layer.cornerRadius = self.frame.height / 2
                self.layer.masksToBounds = true
                
            } else {
                self.layer.cornerRadius = 0
            }
            
        }
    }
    
}

