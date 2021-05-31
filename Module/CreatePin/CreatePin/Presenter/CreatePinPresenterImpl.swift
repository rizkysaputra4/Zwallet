//
//  CreatePinPresenterImpl.swift
//  CreatePin
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import UIKit
import Core

class CreatePinPresenterImpl: CreatePinPresenter {

    let view: CreatePinView
    let interactor: CreatePinInteractor
    let router: CreatePinRouter
    
    init(view: CreatePinView, interactor: CreatePinInteractor, router: CreatePinRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func confirmPin(pin: String) {
        self.interactor.postPin(pin: pin)
    }
    
    func confirmOtp(email: String, otp: String) {
        self.interactor.postOtp(email: email, otp: otp)
    }
    
    func showLogin(viewController: UIViewController) {
        self.router.navigateToLogin(viewController: viewController)
    }
}

extension CreatePinPresenterImpl: CreatePinInteractorOutput {
    
    func postPinResult(isSuccess: Bool, message: String) {
        
        if isSuccess {
            view.showCreatePinSuccess()
        } else {
            view.showError(message: message)
        }
        
    }
    
    func postConfirmOtp(isSuccess: Bool, message: String) {
        if isSuccess {
            view.showCreatePinSuccess()
        } else {
            view.showError(message: message)
        }
    }
}
