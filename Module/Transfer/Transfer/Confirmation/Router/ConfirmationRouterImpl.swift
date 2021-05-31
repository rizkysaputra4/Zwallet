//
//  ConfirmationRouterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class ConfirmationRouterImpl {
    
    public static func navigateToConfirmation(viewController: UIViewController, makeTransferData: MakeTransferEntity) {
        let bundle = Bundle(identifier: "com.casestudy.Transfer")
        let vc = ConfirmationViewController(nibName: "ConfirmationViewController", bundle: bundle)
        
        let transferNetworkManager = TransferNetworkManagerImpl()
        
        let router = ConfirmationRouterImpl()
        let interactor = ConfirmationInteractorImpl(networkManager: transferNetworkManager)
        let presenter = ConfirmationPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        interactor.makeTransfer = makeTransferData
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ConfirmationRouterImpl: ConfirmationRouter {

    func navigateToBack(vc: UIViewController) {
        vc.navigationController?.popViewController(animated: true)
    }
    
    func navigateToPinConfirmation(vc: UIViewController, data: MakeTransferEntity) {
        PinConfirmationRouterImpl.navigateToPinConfirmation(viewController: vc, makeTransferData: data)
    }
}
