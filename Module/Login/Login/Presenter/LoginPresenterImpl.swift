//
//  LoginPresenterImpl.swift
//  Login
//
//  Created by Rizky Saputra on 24/05/21.
//

import Foundation
import UIKit

class LoginPresenterImpl: LoginPresenter {
    
    let view: LoginView
    let interactor: LoginInteractor
    let router: LoginRouter
    
    init(view: LoginView, interactor: LoginInteractor, router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func login(email: String, password: String) {
        self.interactor.postLoginData(email: email, password: password)
    }
    
    func showRegister(viewController: UIViewController) {
        self.router.navigateToRegister(viewController: viewController)
    }
    
    func showCreatePin(viewController: UIViewController) {
        self.router.navigateToCreatePin(viewController: viewController)
    }
}

extension LoginPresenterImpl: LoginInteractorOutput {

    func authenticationResult(isSuccess: Bool) {
        view.stopLoading()
        if isSuccess {
            self.router.navigateToHome()
        } else {
            self.view.showError()
        }
        
        self.view.stopLoading()
    }
        
    func toCreatePin() {
        view.stopLoading()
        self.view.showCreatePin()
    }
}
