//
//  ConfirmOtpPresenterImpl.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import UIKit
import Core

class ConfirmOtpPresenterImpl: ConfirmOtpPresenter {

    let view: ConfirmOtpView
    let interactor: ConfirmOtpInteractor
    let router: ConfirmOtpRouter
    
    init(view: ConfirmOtpView, interactor: ConfirmOtpInteractor, router: ConfirmOtpRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func confirmOtp(email: String, otp: String) {
        self.interactor.postOtp(email: email, otp: otp)
    }
    
    func navigateToCreateLogin(viewController: UIViewController) {
        self.router.navigateToCreatePin(viewController: viewController)
    }
}

extension ConfirmOtpPresenterImpl: ConfirmOtpInteractorOutput {
    func postConfirmOtp(isSuccess: Bool, message: String) {
        if isSuccess {
            view.showLoginPage()
        } else {
            view.showError(message: message)
        }
    }
}
