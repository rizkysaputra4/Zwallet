//
//  ConfirmOtpCellDelegate.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import UIKit

protocol ConfirmOtpCellDelegate {
    func submitConfirmOtp(email: String, otp: String)
}
