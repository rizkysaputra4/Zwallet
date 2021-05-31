//
//  SearchReceiverPresenterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import Core
import UIKit

class SearchReceiverPresenterImpl: SearchReceiverPresenter {

    let view: SearchReceiverView
    let interactor: SearchReceiverInteractor
    let router: SearchReceiverRouter
    
    init(view: SearchReceiverView, interactor: SearchReceiverInteractor, router: SearchReceiverRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func searchReceiver(keyword: String) {
        self.interactor.searchReceiver(keyword: keyword)
    }
    
    func toInputAmountScene(viewController: UIViewController, transferData: MakeTransferEntity) {
        self.router.navigateToInputAmount(viewController: viewController, transferData: transferData)
    }
}

extension SearchReceiverPresenterImpl: SearchReceiverInteractorOutput {
    
    func searchReceiverResult(isSuccess: Bool, message: String, searchResult: [ReceiverData]?) {
        
        guard let searchData = searchResult else {
            self.view.showError(message: message)
            return
        }
        
        if isSuccess {
            self.view.showReceiver(receivers: searchData)
        } else {
            self.view.showError(message: message)
        }
    }
    
}
