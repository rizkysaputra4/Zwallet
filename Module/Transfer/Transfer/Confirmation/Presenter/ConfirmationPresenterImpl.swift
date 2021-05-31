//
//  ConfirmationPresenterImpl.swift
//  Transfer
//
//  Created by Rizky Saputra on 29/05/21.
//

import Foundation
import UIKit
import Core

class ConfirmationPresenterImpl: ConfirmationPresenter {

    let view: ConfirmationView
    let interactor: ConfirmationInteractor
    let router: ConfirmationRouter
    
    init(view: ConfirmationView, interactor: ConfirmationInteractor, router: ConfirmationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func navigateToBack(vc: UIViewController) {
        self.router.navigateToBack(vc: vc)
    }
    
    func loadData() {
        self.interactor.loadData()
    }
    
    func navigateToPinConfirmation(vc: UIViewController, data: MakeTransferEntity) {
        self.router.navigateToPinConfirmation(vc: vc, data: data)
    }
    
}

extension ConfirmationPresenterImpl: ConfirmationInteractorOutput {
    
    func loadTransferData(data: MakeTransferEntity) {
        self.view.showData(data: data)
    }
}
