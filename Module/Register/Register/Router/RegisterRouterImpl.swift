//
//  RegisterRouterImpl.swift
//  Register
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit
import Core

public class RegisterRouterImpl {
    
    public  static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Register")
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: bundle)
       
        let authNetworkManager = AuthNetworkManagerImpl()
        
        let router = RegisterRouterImpl()
        let interactor = RegisterInteractorImpl(networkManager: authNetworkManager)
        let presenter = RegisterPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RegisterRouterImpl: RegisterRouter {

    func NavigateToLogin(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func NavigateToEmailVerification(viewController: UIViewController) {
        AppRouter.shared.navigateToEmailVerification(viewController)
    }
    
    func navigateToCreatePin(viewController: UIViewController) {
        AppRouter.shared.navigateToCreatePin(viewController)
    }
    
    func NavigateToConfirmOtp(viewController: UIViewController) {
        AppRouter.shared.navigateToConfirmOtp(viewController)
    }
    
}
