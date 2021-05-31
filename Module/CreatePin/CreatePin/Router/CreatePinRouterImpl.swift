//
//  CreatePinImpl.swift
//  CreatePin
//
//  Created by Rizky Saputra on 26/05/21.
//

import Foundation
import UIKit
import Core

public class CreatePinRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.CreatePin")
        let vc = CreatePinViewController(nibName: "CreatePinViewController", bundle: bundle)
        
        let authNetworkManager = AuthNetworkManagerImpl()
        let router = CreatePinRouterImpl()
        let interactor = CreatePinInteractorImpl(networkManager: authNetworkManager)
        let presenter = CreatePinPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CreatePinRouterImpl: CreatePinRouter {
    
    func navigateToLogin(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
