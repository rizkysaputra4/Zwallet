//
//  PinConfirmationRouterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class PinConfirmationRouterImpl {
    
    public static func navigateToPinConfirmation(viewController: UIViewController, makeTransferData: MakeTransferEntity) {
        let bundle = Bundle(identifier: "com.casestudy.Transfer")
        let vc = PinConfirmationViewController(nibName: "PinConfirmationViewController", bundle: bundle)
        

        let transferManager = TransferNetworkManagerImpl()
        
        let router = PinConfirmationRouterImpl()
        let interactor = PinConfirmationInteractorImpl(transferManager: transferManager)
        let presenter = PinConfirmationPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        interactor.makeTransfer = makeTransferData
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PinConfirmationRouterImpl: PinConfirmationRouter {
        
    func navigateToTransactionStatus(vc: UIViewController, response: TransferReceive?, data: MakeTransferEntity) {
        StatusRouterImpl.navigateToStatus(viewController: vc, makeTransferData: data, response: response)
    }
    
    func navigateToBack(vc: UIViewController) {
        vc.navigationController?.popViewController(animated: true)
    }

}
