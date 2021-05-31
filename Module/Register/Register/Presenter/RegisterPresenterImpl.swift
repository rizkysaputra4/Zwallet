//
//  RegisterPresenterImpl.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit
import Core

class RegisterPresenterImpl: RegisterPresenter {

    let view: RegisterView
    let interactor: RegisterInteractor
    let router: RegisterRouter
    
    init(view: RegisterView, interactor: RegisterInteractor, router: RegisterRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    

    func register(email: String, userName: String, password: String) {
        self.interactor.postRegisterData(userName: userName, email: email, password: password)
    }
    
    func navigateToLogin(viewController: UIViewController) {
        self.router.NavigateToLogin(viewController: viewController)
    }
    
    func navigateToCreatePin(viewController: UIViewController) {
        self.router.navigateToCreatePin(viewController: viewController)
    }
    
    func navigateToConfirmOtp(viewController: UIViewController) {
        self.router.NavigateToConfirmOtp(viewController: viewController)
    }
}

extension RegisterPresenterImpl: RegisterInteractorOutput {
    
    func authtenticateRegisterResult(isSuccess: Bool, message: String) {
        
        view.reloadTable()
        if isSuccess {
            view.showConfirmToken()
        } else {
            view.showError(message: message)
        }
    }
}
