//
//  ConfirmPinInteractorImpl.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import Core

class ConfirmOtpInteractorImpl: ConfirmOtpInteractor {
    
    var interactorOutput: ConfirmOtpInteractorOutput?
    var authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager){
        self.authNetworkManager = networkManager
    }
    
    func postOtp(email: String, otp: String) {
        self.authNetworkManager.confirmOtp(email: email, otp: otp) { (data, error) in
            
            guard let confirmOtpResponse = data else {
                self.interactorOutput?.postConfirmOtp(isSuccess: false, message: error.debugDescription)
                return
            }
            
            if confirmOtpResponse.status == 200 {
                self.interactorOutput?.postConfirmOtp(isSuccess: true, message: "")
            } else {
                self.interactorOutput?.postConfirmOtp(isSuccess: false, message: confirmOtpResponse.message)
            }
        }
    }
}
