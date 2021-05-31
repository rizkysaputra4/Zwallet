//
//  InputAmountRouterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

public class InputAmountRouterImpl: InputAmountRouter {

    public static func navigateToInputAmount(viewController: UIViewController, makeTransferData: MakeTransferEntity) {
        let bundle = Bundle(identifier: "com.casestudy.Transfer")
        let vc = InputAmountView(nibName: "InputAmountView", bundle: bundle)
        
        let inputAmountNetworkManager = TransferNetworkManagerImpl()
        
        let router = InputAmountRouterImpl()
        let interactor = InputAmountInteractorImpl(networkManager: inputAmountNetworkManager)
        let presenter = InputAmountPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        interactor.presenter = presenter
        interactor.makeTransfer = makeTransferData
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToConfirmation(vc: UIViewController, transferData: MakeTransferEntity) {
        ConfirmationRouterImpl.navigateToConfirmation(viewController: vc, makeTransferData: transferData)
    }
    
    func navigateToBack(vc: UIViewController) {
        vc.navigationController?.popViewController(animated: true)
    }
}


