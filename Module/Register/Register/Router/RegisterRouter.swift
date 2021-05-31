//
//  RegisterRouter.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit

protocol RegisterRouter {
    func NavigateToLogin(viewController: UIViewController)
    func NavigateToEmailVerification(viewController: UIViewController)
    func navigateToCreatePin(viewController: UIViewController)
    func NavigateToConfirmOtp(viewController: UIViewController)
}
