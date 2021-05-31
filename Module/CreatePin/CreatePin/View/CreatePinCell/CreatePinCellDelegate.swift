//
//  CreatePinCellDelegate.swift
//  CreatePin
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit

protocol CreatePinCellDelegate {
    func submitPin(pin: String)
    func showLoginScene()
    func submitOtp(email: String, otp: String)
//    func showSuccessCreatePin(cell: CreatePinCell)
}
