//
//  CreatePinInteractorImpl.swift
//  CreatePin
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import Core

class CreatePinInteractorImpl: CreatePinInteractor {

    var interactorOutput: CreatePinInteractorOutput?
    var authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postPin(pin: String) {
        self.authNetworkManager.createPin(pin: pin) { (data, error) in
            guard let createPinData = data else {
                self.interactorOutput?.postPinResult(isSuccess: false, message: error.debugDescription)
                return
            }
            
            if createPinData.status == 200 {
                self.interactorOutput?.postPinResult(isSuccess: true, message: "")
            } else {
                self.interactorOutput?.postPinResult(isSuccess: false, message: createPinData.message)
            }
        }
    }
    
    func postOtp(email: String, otp: String) {
        self.authNetworkManager.confirmOtp(email: email, otp: otp) { (data, error) in
            guard let confirmOtpData = data else {
                self.interactorOutput?.postConfirmOtp(isSuccess: false, message: error.debugDescription)
                return
            }
            
            if confirmOtpData.status == 200 {
                self.interactorOutput?.postConfirmOtp(isSuccess: true, message: "")
            } else {
                self.interactorOutput?.postConfirmOtp(isSuccess: false, message: error.debugDescription)
            }
        }
    }
}
