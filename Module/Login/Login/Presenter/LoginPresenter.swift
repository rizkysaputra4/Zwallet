//
//  LoginPresenter.swift
//  Login
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import UIKit

protocol LoginPresenter {
    func login(email: String, password: String)
    func showRegister(viewController: UIViewController)
    func showCreatePin(viewController: UIViewController)
}
