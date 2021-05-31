//
//  CreatePinPresenter.swift
//  CreatePin
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import UIKit

protocol CreatePinPresenter {
    func confirmPin(pin: String)
    func confirmOtp(email: String, otp: String)
    func showLogin(viewController: UIViewController)
}
