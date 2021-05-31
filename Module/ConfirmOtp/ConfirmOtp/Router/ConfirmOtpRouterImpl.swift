//
//  ConfirmOtpRouterImpl.swift
//  ConfirmOtp
//
//  Created by Rizky Saputra on 27/05/21.
//

import Foundation
import UIKit
import Core

public class ConfirmOtpRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.ConfirmOtp")
        let vc = ConfirmOtpViewController(nibName: "ConfirmOtpViewController", bundle: bundle)
        
        let authNetworkManager = AuthNetworkManagerImpl()
        let router = ConfirmOtpRouterImpl()
        let interactor = ConfirmOtpInteractorImpl(networkManager: authNetworkManager)
        let presenter = ConfirmOtpPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ConfirmOtpRouterImpl: ConfirmOtpRouter {
    func navigateToCreatePin(viewController: UIViewController) {
        AppRouter.shared.navigateToCreatePin(viewController)
    }
}
