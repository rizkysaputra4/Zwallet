//
//  CreatePinCustomVIewDelegate.swift
//  CreatePin
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation

protocol CreatePinCustomCellViewDelegate {
    func submitPin(pin: String)
    func submitOtp(email: String, otp: String)
    func showLoginScene()
}
