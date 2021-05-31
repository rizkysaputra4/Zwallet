//
//  HistoryPresenterImpl.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import Foundation
import UIKit
import Core

class HistoryPresenterImpl: HistoryPresenter {

    let view: HistoryView
    let interactor: HistoryInteractor
    let router: HistoryRouter
    
    init(view: HistoryView, interactor: HistoryInteractor, router: HistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadTransaction() {
        self.interactor.getTransaction()
    }
    
    func filterBy() {
        
    }
    
    func navigateToHome(viewController: UIViewController) {
        router.navigateToHome(viewController: viewController)
    }
}

extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadedTransaction(transactions: [TransactionHistoryEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }
    
    func toHome() {
        self.view.toHome()
    }
}
