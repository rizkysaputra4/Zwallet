//
//  SearchReceiverRouterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

public class SearchReceiverRouterImpl {
    
    public  static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Transfer")
        let vc = SearchReceiverView(nibName: "SearchReceiverView", bundle: bundle)
       
        let searchReceiverNetworkManager = TransferNetworkManagerImpl()
        
        let router = SearchReceiverRouterImpl()
        let interactor = SearchReceiverInteractorImpl(networkManager: searchReceiverNetworkManager)
        let presenter = SearchReceiverPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        presenter.searchReceiver(keyword: "")
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchReceiverRouterImpl: SearchReceiverRouter {
    
    func navigateToInputAmount(viewController: UIViewController, transferData: MakeTransferEntity) {
        InputAmountRouterImpl.navigateToInputAmount(viewController: viewController, makeTransferData: transferData)
    }
}
