//
//  TextAreaExtension.swift
//  Core
//
//  Created by Rizky Saputra on 31/05/21.
//

import Foundation
import UIKit

public extension UITextField {
    
    func numberOnly() {
        return self.text = self.text?.filter("1234567890".contains)
    }
}
