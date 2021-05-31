//
//  CreatePinInteractorOutput.swift
//  CreatePin
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation

protocol CreatePinInteractorOutput {
    func postPinResult(isSuccess: Bool, message: String)
    func postConfirmOtp(isSuccess: Bool, message: String)
}
