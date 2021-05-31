//
//  ErrorAlert.swift
//  Core
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit

public func errorAlert(vc: UIViewController, message: String) {
    let alert = UIAlertController(
        title: "Peringatan",
        message: "Error: \(message)",
        preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}
