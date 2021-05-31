//
//  CreatePinView.swift
//  CreatePin
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit

protocol CreatePinView {
    func showLogin()
    func showError(message: String)
    func showCreatePinSuccess()
}
