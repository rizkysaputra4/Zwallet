//
//  ConfirmPinInteractorOutput.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation

protocol ConfirmOtpInteractorOutput {
    func postConfirmOtp(isSuccess: Bool, message: String)
}
