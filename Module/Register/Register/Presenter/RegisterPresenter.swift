//
//  RegisterPresenter.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit

protocol RegisterPresenter {
    func register(email: String, userName: String, password: String)
    func navigateToLogin(viewController: UIViewController)
    func navigateToCreatePin(viewController: UIViewController)
    func navigateToConfirmOtp(viewController: UIViewController)
    
}
