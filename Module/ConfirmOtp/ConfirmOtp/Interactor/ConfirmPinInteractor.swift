//
//  ConfirmPinInteractor.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation

protocol ConfirmOtpInteractor {
    func postOtp(email: String, otp: String)
}
