//
//  ButtonExtension.swift
//  Core
//
//  Created by Rizky Saputra on 30/05/21.
//

import Foundation
import UIKit

public extension UIButton {
    
    func setBorder(width: Int, radius: Int, color: CGColor) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderColor = color
        
    }
}
