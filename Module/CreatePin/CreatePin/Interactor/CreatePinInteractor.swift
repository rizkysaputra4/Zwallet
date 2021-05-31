//
//  CreatePinInteractor.swift
//  CreatePin
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation

protocol CreatePinInteractor {
    func postPin(pin: String)
    func postOtp(email: String, otp: String)
}
