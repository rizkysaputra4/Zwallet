//
//  ViewExtension.swift
//  Core
//
//  Created by Rizky Saputra on 30/05/21.
//

import Foundation
import UIKit

public extension UIView {
    
    func setBorder(radius: Int, width: Int, color: CGColor, withShadow: Bool) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color
        self.layer.cornerRadius = CGFloat(radius)
        
        if withShadow {
            let shadow = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGFloat(radius)).cgPath
            self.layer.shadowRadius = 1
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.masksToBounds = false
            self.layer.shadowPath = shadow
        }
    }
    
//    func setShadow() {
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
//    }
}
