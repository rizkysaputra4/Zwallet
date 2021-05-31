//
//  LoginRouter.swift
//  Login
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import UIKit

protocol LoginRouter {
    func navigateToHome()
    func navigateToRegister(viewController: UIViewController)
    func navigateToCreatePin(viewController: UIViewController)
}
