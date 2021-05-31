//
//  ConfirmOtpPresenter.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import UIKit

protocol ConfirmOtpPresenter {
    func confirmOtp(email: String, otp: String)
    func navigateToCreateLogin(viewController: UIViewController)
}
