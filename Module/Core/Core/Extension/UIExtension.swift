//
//  UIExtension.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import UIKit

public extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
