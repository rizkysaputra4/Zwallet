//
//  HistoryRouterImpl.swift
//  History
//
//  Created by Rizky Saputra on 25/05/21.
//

import Foundation
import UIKit
import Core

public class HistoryRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.History")
        let vc = HistoryViewController(nibName: "HistoryViewController", bundle: bundle)
        
        
        let invoiceNetworkManager = InvoiceNetworkManagerImpl()
        let router = HistoryRouterImpl()
        let interactor = HistoryInteractorImpl(invoiceNetworkManager: invoiceNetworkManager)
        let presenter = HistoryPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HistoryRouterImpl: HistoryRouter {
    
    func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
}
