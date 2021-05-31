//
//  StatusRouterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class StatusRouterImpl {
    
    public static func navigateToStatus(viewController: UIViewController, makeTransferData: MakeTransferEntity, response: TransferReceive?) {
        let bundle = Bundle(identifier: "com.casestudy.Transfer")
        let vc = StatusViewController(nibName: "StatusViewController", bundle: bundle)
        
        let transferNetworkManager = TransferNetworkManagerImpl()
        
        let router = StatusRouterImpl()
        let interactor = StatusInteractorImpl(networkManager: transferNetworkManager)
        let presenter = StatusPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        interactor.makeTransfer = makeTransferData
        interactor.transferResponse = response
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension StatusRouterImpl: StatusRouter {
    
    func navigateToRoot(vc: UIViewController) {
        AppRouter.shared.navigateToHome()
    }

    func navigateToBack(vc: UIViewController) {
        vc.navigationController?.popViewController(animated: true)
    }
    

}
